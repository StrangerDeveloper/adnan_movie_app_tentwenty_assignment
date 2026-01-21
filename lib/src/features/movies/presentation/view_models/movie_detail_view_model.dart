import 'dart:async';

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/logs/logs_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/domain/entities/movie_image_entity.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/domain/entities/movie_video_entity.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/domain/use_cases/get_movie_images_use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/domain/use_cases/get_movie_videos_use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/entities/genre_entity.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/use_cases/get_movie_genre_use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';
import 'package:flutter/foundation.dart';

enum MovieDetailState { initial, loading, loaded, error }

class MovieDetailViewModel extends ChangeNotifier {
  MovieDetailViewModel({required int movieId}) : _movieId = movieId {
    loadMovieDetails(_movieId);
    loadGenres();
  }

  final int _movieId;

  /* -------------------------------------------------------------------------- */
  /*                                  DATA                                      */
  /* -------------------------------------------------------------------------- */
  MovieDetailState _state = MovieDetailState.initial;
  MovieEntity? _movie;
  List<MovieVideoEntity?> _videos = [];
  List<MovieImageEntity?> _images = [];
  List<GenreEntity?> genres = [];
  String? _errorMessage;
  bool _isLoadingVideos = false;
  bool _isLoadingImages = false;

  // Stream subscription for reactive updates
  //StreamSubscription<Movie?>? _movieStreamSubscription;

  /* -------------------------------------------------------------------------- */
  /*                                  GETTERS                                   */
  /* -------------------------------------------------------------------------- */
  MovieDetailState get state => _state;

  MovieEntity? get movie => _movie;

  List<MovieVideoEntity?> get videos => _videos;

  List<MovieImageEntity?> get images => _images;

  String? get errorMessage => _errorMessage;

  bool get isLoadingVideos => _isLoadingVideos;

  bool get isLoadingImages => _isLoadingImages;

  List<String?> getMovieGenres() {
    if (_movie?.genres?.isNotEmpty == true) {
      return _movie!.genres!.map((genre) => genre.name).toList();
    }

    if (_movie?.genreIds == null || genres.isEmpty) {
      return [];
    }

    return _movie!.genreIds!
        .map((genreId) {
          final genre = genres.firstWhere((g) => g?.id == genreId, orElse: () => null);
          return genre?.name;
        })
        .where((name) => name != null)
        .cast<String>()
        .toList();
  }

  MovieVideoEntity? get trailerVideo {
    try {
      return _videos.firstWhere(
        (video) => video?.type?.toLowerCase() == 'trailer' && video?.site?.toLowerCase() == 'youtube',
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> loadMovieDetails(int movieId) async {
    try {
      _state = MovieDetailState.loading;
      _errorMessage = null;
      notifyListeners();

      //parms
      final params = {"id": movieId.toString()};

      injectedApiCallService.callApi(
        useCase: injector<GetMovieDetailsUseCase>(),
        params: params,
        onSuccess: ({responseCode, responseMessage, required successResponse}) async {
          _movie = successResponse;
          // Load from API (this will trigger cache update, which will emit stream event)
          _state = MovieDetailState.loaded;
          notifyListeners();

          // Load videos and images in parallel
          await Future.wait([loadMovieVideos(movieId), loadMovieImages(movieId)]);
        },
        onFailure: ({required errorResponse, responseCode}) {
          "Error: $errorResponse".logError();
        },
      );
    } catch (e) {
      _state = MovieDetailState.error;
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
    } finally {
      if (_state != MovieDetailState.error) {
        notifyListeners();
      }
    }
  }

  Future<void> loadMovieVideos(int movieId) async {
    try {
      _isLoadingVideos = true;
      notifyListeners();
      //params
      final params = {"id": movieId.toString()};
      await injectedApiCallService.callApi(
        useCase: injector<GetMovieVideosUseCase>(),
        params: params,
        onSuccess: ({responseCode, responseMessage, required successResponse}) {
          if (successResponse != null) {
            // Extract the results list from MovieVideoResponseModel
            _videos = successResponse.results;
          } else {
            _videos = [];
          }
          notifyListeners();
        },
        onFailure: ({required errorResponse, responseCode}) {
          "Error: $errorResponse".logError();
        },
      );
    } catch (e) {
      // Don't set error state for videos, just log
      debugPrint('Error loading videos: $e');
    } finally {
      _isLoadingVideos = false;
      notifyListeners();
    }
  }

  Future<void> loadMovieImages(int movieId) async {
    try {
      _isLoadingImages = true;
      notifyListeners();

      //params
      final params = {"id": movieId.toString()};
      await injectedApiCallService.callApi(
        useCase: injector<GetMovieImagesUseCase>(),
        params: params,
        onSuccess: ({responseCode, responseMessage, required successResponse}) {
          if (successResponse != null) {
            // Combine all images from backdrops, posters, and logos into a single list
            _images = [...successResponse.backdrops, ...successResponse.posters, ...successResponse.logos];
          } else {
            _images = [];
          }
          notifyListeners();
        },
        onFailure: ({required errorResponse, responseCode}) {
          "Error: $errorResponse".logError();
        },
      );
    } catch (e) {
      // Don't set error state for images, just log
      debugPrint('Error loading images: $e');
    } finally {
      _isLoadingImages = false;
      notifyListeners();
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                                  GENRE METHODS                             */
  /* -------------------------------------------------------------------------- */
  Future<void> loadGenres() async {
    //params
    final params = {};

    await injectedApiCallService.callListApi(
      useCase: injector<GetMovieGenresUseCase>(),
      params: params,
      onSuccess: ({responseCode, responseMessage, required successResponse}) {
        genres = successResponse ?? [];
        notifyListeners();
      },
      onFailure: ({required errorResponse, responseCode}) {
        "Error: $errorResponse".logError();
      },
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                                  DISPOSE                                   */
  /* -------------------------------------------------------------------------- */

  void clear() {
    _state = MovieDetailState.initial;
    _movie = null;
    _videos = [];
    _images = [];
  }

  @override
  void dispose() {
    clear();
    //_movieStreamSubscription?.cancel();
    super.dispose();
  }
}
