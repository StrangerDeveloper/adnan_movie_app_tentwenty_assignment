import 'dart:async';

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/logs/logs_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/entities/genre_entity.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/use_cases/get_movie_genre_use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/use_cases/search_movie_use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

enum MovieSearchState { initial, loading, loaded, error }

/// ViewModel for Movie Search screen
class MovieSearchViewModel extends ChangeNotifier {
  MovieSearchViewModel() {
    loadGenres();
  }

  /* -------------------------------------------------------------------------- */
  /*                                  STATE                                     */
  /* -------------------------------------------------------------------------- */
  MovieSearchState _state = MovieSearchState.initial;
  String? _errorMessage;
  String _query = '';
  int _currentPage = 1;
  bool _hasMore = true;

  /* -------------------------------------------------------------------------- */
  /*                                  DATA                                      */
  /* -------------------------------------------------------------------------- */
  List<MovieEntity?> _movies = [];
  List<GenreEntity?> _genres = [];

  /* -------------------------------------------------------------------------- */
  /*                                  CONTROLLERS                               */
  /* -------------------------------------------------------------------------- */
  final searchController = TextEditingController();
  Timer? debounceTimer;

  /* -------------------------------------------------------------------------- */
  /*                                  GETTERS                                   */
  /* -------------------------------------------------------------------------- */
  MovieSearchState get state => _state;
  List<MovieEntity?> get movies => _movies;
  String? get errorMessage => _errorMessage;
  String get query => _query;
  bool get hasMore => _hasMore;
  List<GenreEntity?> get genres => _genres;
  bool get isSearching => _query.isNotEmpty;

  /* -------------------------------------------------------------------------- */
  /*                                  SEARCH METHODS                            */
  /* -------------------------------------------------------------------------- */
  void onSearchChanged(String query) {
    debounceTimer?.cancel();
    debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        search(query);
      } else {
        clear();
      }
    });
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      _movies = [];
      _state = MovieSearchState.initial;
      notifyListeners();
      return;
    }

    _query = query;
    _currentPage = 1;
    _hasMore = true;

    try {
      _state = MovieSearchState.loading;
      _errorMessage = null;
      notifyListeners();

      final results = await callSearchMoviesApi(query, page: _currentPage);
      _movies = results;
      _hasMore = results.isNotEmpty;
      _currentPage++;
      _state = MovieSearchState.loaded;
    } catch (e) {
      _state = MovieSearchState.error;
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      _movies = [];
    } finally {
      notifyListeners();
    }
  }

  Future<void> loadMore() async {
    if (_state == MovieSearchState.loading || !_hasMore || _query.isEmpty) {
      return;
    }

    try {
      _state = MovieSearchState.loading;
      notifyListeners();

      final results = await callSearchMoviesApi(_query, page: _currentPage);
      _movies.addAll(results);
      _hasMore = results.isNotEmpty;
      _currentPage++;
      _state = MovieSearchState.loaded;
    } catch (e) {
      _state = MovieSearchState.error;
      _errorMessage = e.toString().replaceAll('Exception: ', '');
    } finally {
      notifyListeners();
    }
  }

  Future<List<MovieEntity?>> callSearchMoviesApi(
    String query, {
    int page = 1,
  }) async {
    //params
    final params = {'query': query, 'page': page};

    await injectedApiCallService.callListApi(
      useCase: injector<SearchMovieUseCase>(),
      params: params,
      onSuccess: ({responseCode, responseMessage, required successResponse}) {
        _movies = successResponse ?? [];
      },
      onFailure: ({required errorResponse, responseCode}) {
        "Error: $errorResponse".logError();
        _movies = [];
      },
    );
    return _movies;
  }

  void cancelTimer() {
    debounceTimer?.cancel();
    clear();
  }

  void clear() {
    _movies = [];
    _query = '';
    _currentPage = 1;
    _hasMore = true;
    _state = MovieSearchState.initial;
    _errorMessage = null;
    searchController.clear();
    notifyListeners();
  }

  /* -------------------------------------------------------------------------- */
  /*                                  GENRE METHODS                             */
  /* -------------------------------------------------------------------------- */
  Future<void> loadGenres() async {
    //params
    final params = {"page": "1"};
    await injectedApiCallService.callListApi(
      useCase: injector<GetMovieGenresUseCase>(),
      params: params,
      onSuccess: ({responseCode, responseMessage, required successResponse}) {
        _genres = successResponse ?? [];
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
  @override
  void dispose() {
    debounceTimer?.cancel();
    searchController.dispose();
    super.dispose();
  }
}
