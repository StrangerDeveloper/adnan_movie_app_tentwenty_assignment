import 'dart:async';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/constants/api_constants/api_constants.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/api_response_type/api_response.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/api_response_type/app_api_response.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/remote/api_client/api_client.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/remote/api_methods/api_methods.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/remote/api_route/api_route.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/data/models/movie_images_response_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/data/models/movie_video_response_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/domain/repositories/movie_repository.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/data/models/movie_model.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';

/// Repository implementation - coordinates between remote and local data sources
/// Implements cache-first strategy following Clean Architecture
class MovieRepositoryImpl implements MovieRepository {
  // final MovieRemoteDataSource remoteDataSource;
  // final MovieLocalDataSource localDataSource;
  final APIClient apiClient;
  final ApiConstants apiConstants;

  // Cache expiry durations
  // static const Duration _moviesCacheExpiry = Duration(hours: 1);
  // static const Duration _movieDetailCacheExpiry = Duration(hours: 24);

  MovieRepositoryImpl({required this.apiClient, required this.apiConstants});

  @override
  Future<AppApiResponse<MovieEntity?>> getMovieDetails({Map<String, dynamic>? params}) async {

     String processedPath = apiConstants.getMovieDetails;
     if (processedPath.contains(':id')) {
       final id = params?['id'] ?? params?['movieId'];
      if (id != null) {
         processedPath = processedPath.replaceAll(':id', id.toString());
       }
    }
    final config = ApiRoute(
      path: processedPath,
      method: ApiMethods.get,
      headers: apiConstants.getDefaultHeaders(),
      params: params,
    );

    return await apiClient.request<ApiResponse<MovieEntity?>>(
      config: config,
      create: () => ApiResponse<MovieModel?>(create: () => MovieModel()),
    );
  }

  @override
  Future<AppApiResponse<MovieImagesResponseModel>> getMovieImages({Map<String, dynamic>? params}) async {
    String processedPath = apiConstants.getImages;
    if (processedPath.contains(':id')) {
      final id = params?['id'] ?? params?['movieId'];
      if (id != null) {
        processedPath = processedPath.replaceAll(':id', id.toString());
      }
    }


    final config = ApiRoute(
      path: processedPath,
      method: ApiMethods.get,
      headers: apiConstants.getDefaultHeaders(),
      params: params,
    );
    return await apiClient.request<ApiResponse<MovieImagesResponseModel>>(
      config: config,
      create: () => ApiResponse<MovieImagesResponseModel>(create: () => MovieImagesResponseModel()),
    );
  }

  @override
  Future<AppApiResponse<MovieVideoResponseModel>> getMovieVideos({Map<String, dynamic>? params}) async {
    String processedPath = apiConstants.getMovieVideos;
    if (processedPath.contains(':id')) {
      final id = params?['id'] ?? params?['movieId'];
      if (id != null) {
        processedPath = processedPath.replaceAll(':id', id.toString());
      }
    }

    final config = ApiRoute(
      path: processedPath,
      method: ApiMethods.get,
      headers: apiConstants.getDefaultHeaders(),
      params: params,
    );
    return await apiClient.request<ApiResponse<MovieVideoResponseModel>>(
      config: config,
      create: () => ApiResponse<MovieVideoResponseModel>(create: () => MovieVideoResponseModel()),
    );
  }

  // /// Helper to convert MovieEntity to Movie domain entity
  // Movie _entityToMovie(dynamic entity) {
  //   return Movie(
  //     id: entity.id,
  //     title: entity.title,
  //     overview: entity.overview,
  //     posterPath: entity.posterPath,
  //     backdropPath: entity.backdropPath,
  //     releaseDate: entity.releaseDate,
  //     voteAverage: entity.voteAverage,
  //     voteCount: entity.voteCount,
  //     genreIds: null, // MovieEntity doesn't have genreIds
  //     originalLanguage: entity.originalLanguage,
  //     originalTitle: null, // MovieEntity doesn't have originalTitle
  //     adult: entity.adult,
  //     video: null, // MovieEntity doesn't have video
  //     popularity: entity.popularity,
  //   );
  // }

  // /// Helper to convert MovieModel to Movie domain entity
  // Movie _modelToMovie(MovieModel model) {
  //   return Movie(
  //     id: model.id ?? 0,
  //     title: model.title ?? '',
  //     overview: model.overview,
  //     posterPath: model.posterPath,
  //     backdropPath: model.backdropPath,
  //     releaseDate: model.releaseDate,
  //     voteAverage: model.voteAverage,
  //     voteCount: model.voteCount,
  //     genreIds: model.genreIds,
  //     originalLanguage: model.originalLanguage,
  //     originalTitle: model.originalTitle,
  //     adult: model.adult,
  //     video: model.video,
  //     popularity: model.popularity,
  //   );
  // }

  /// Check if cache is still valid
  // bool _isCacheValid(int cachedAtTimestamp, Duration expiryDuration) {
  //   final cachedDate = DateTime.fromMillisecondsSinceEpoch(cachedAtTimestamp);
  //   return DateTime.now().difference(cachedDate) < expiryDuration;
  // }

  // @override
  // Stream<List<Movie>> watchUpcomingMovies({int page = 1}) async* {
  //   // Watch cached movies and map to domain entities
  //   yield* localDataSource.watchCachedMovies(page: page).asyncMap((entities) {
  //     return entities.map((e) => _entityToMovie(e)).toList();
  //   });
  // }

  // @override
  // Future<Movie> getMovieDetails(int movieId) async {
  //   // Cache-first strategy: Try cache first
  //   try {
  //     final cachedDetail = await localDataSource.getCachedMovieDetail(movieId);
  //     if (cachedDetail != null) {
  //       // Check if cache is valid
  //       if (_isCacheValid(cachedDetail.cachedAt, _movieDetailCacheExpiry)) {
  //         // Return cached data
  //         return _entityToMovie(cachedDetail);
  //       }
  //     }
  //   } catch (e) {
  //     // Cache error - continue to fetch from API
  //   }
  //
  //   // Fetch from remote API
  //   try {
  //     final response = await remoteDataSource.getMovieDetails(movieId);
  //
  //     // Check for errors in response wrapper
  //     if (response.error != null) {
  //       throw Exception(response.error!.message);
  //     }
  //
  //     // Extract data from response wrapper
  //     final model = response.data;
  //     if (model == null) {
  //       throw Exception('No data received from API');
  //     }
  //
  //     // Cache the result asynchronously (don't wait)
  //     localDataSource.cacheMovieDetail(model).catchError((e) {
  //       // Cache failure shouldn't break the flow
  //     });
  //
  //     // Convert MovieModel to Movie domain entity
  //     return _modelToMovie(model);
  //   } catch (e) {
  //     // If API fails, try to return stale cache if available
  //     try {
  //       final cachedDetail = await localDataSource.getCachedMovieDetail(
  //         movieId,
  //       );
  //       if (cachedDetail != null) {
  //         return _entityToMovie(cachedDetail);
  //       }
  //     } catch (_) {
  //       // If cache also fails, rethrow the original error
  //     }
  //     rethrow;
  //   }
  // }
  //
  // @override
  // Stream<Movie?> watchMovieDetails(int movieId) async* {
  //   // Watch cached movie detail and map to domain entity
  //   yield* localDataSource.watchCachedMovieDetail(movieId).asyncMap((entity) {
  //     return entity != null ? _entityToMovie(entity) : null;
  //   });
  // }
  //
  // @override
  // Future<List<MovieVideoEntity>> getMovieVideos(int movieId) async {
  //   final response = await remoteDataSource.getMovieVideos(movieId);
  //
  //   // Check for errors in response wrapper
  //   if (response.error != null) {
  //     throw Exception(response.error!.message);
  //   }
  //
  //   // Extract data from response wrapper
  //   final videoResponse = response.data;
  //   if (videoResponse == null) {
  //     throw Exception('No data received from API');
  //   }
  //
  //   return videoResponse.results;
  // }
  //
  // @override
  // Future<List<MovieImageEntity>> getMovieImages(int movieId) async {
  //   final response = await remoteDataSource.getMovieImages(movieId);
  //
  //   // Check for errors in response wrapper
  //   if (response.error != null) {
  //     throw Exception(response.error!.message);
  //   }
  //
  //   // Extract data from response wrapper
  //   final imagesResponse = response.data;
  //   if (imagesResponse == null) {
  //     throw Exception('No data received from API');
  //   }
  //
  //   // Return all images (backdrops, posters, logos combined)
  //   return [
  //     ...imagesResponse.backdrops,
  //     ...imagesResponse.posters,
  //     ...imagesResponse.logos,
  //   ];
  // }
}
