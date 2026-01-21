import 'package:adnan_movie_app_tentwenty_assignment/src/config/providers/app_providers.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/config/translation/app_text_styles/app_text_styles.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/config/translation/engine/translation_engine.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/config/translation/english/en.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/constants/api_constants/api_constants.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/constants/app_assets/app_icons.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/constants/app_colors/app_colors.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/constants/app_keys/app_keys.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/constants/app_keys/app_translations_keys.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/remote/api_client/api_client.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/services/generic_api_caller_service/generic_api_caller_service.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/utils/image_url_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/domain/repositories/movie_repository.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/domain/use_cases/get_movie_images_use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/movies/domain/use_cases/get_movie_videos_use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/data/repositories/search_repository_impl.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/repositories/search_repository.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/use_cases/get_movie_genre_use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/search_movie/domain/use_cases/search_movie_use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/data/repositories/watch_repository_impl.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/repositories/watch_repository.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/use_cases/get_upcoming_movies_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

///
/// GetIt instance to be used as a service locator
///
final injector = GetIt.I;

///
/// Inject all the dependencies to getIt
///
Future<void> initializeDependencies() async {
  // Whether to allow reassignment of a dependency
  injector.allowReassignment = true;

  /* -------------------------------------------------------------------------- */
  /*                                  CONSTANTS                                 */
  /* -------------------------------------------------------------------------- */
  injector.registerSingleton<ApiConstants>(ApiConstants());
  injector.registerSingleton<AppKeys>(AppKeys());
  injector.registerSingleton<AppColors>(AppColors());
  injector.registerSingleton<AppIcons>(AppIcons());
  injector.registerSingleton<AppTranslationsKeys>(AppTranslationsKeys());
  injector.registerSingleton<ImageUrlHelper>(ImageUrlHelper());

  injector.registerSingleton<AppTextStyles>(AppTextStyles());

  /* -------------------------------------------------------------------------- */
  /*                                DEPENDENCIES                                */
  /* -------------------------------------------------------------------------- */
  injector.registerSingleton<MethodChannel>(
    MethodChannel(injector<AppKeys>().callMethodChannel),
  );
  injector.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 120),
        receiveTimeout: const Duration(seconds: 120),
        sendTimeout: const Duration(seconds: 120),
      ),
    ),
  );

  /* -------------------------------------------------------------------------- */
  /*                                     APP                                    */
  /* -------------------------------------------------------------------------- */
  injector.registerSingleton<APIClient>(APIClient(dio: injector<Dio>()));
  injector.registerSingleton<AppProviders>(AppProviders());

  /* -------------------------------------------------------------------------- */
  /*                                TRANSLATIONS                                */
  /* -------------------------------------------------------------------------- */
  injector.registerSingleton<English>(English());
  injector.registerSingleton<TranslationEngine>(TranslationEngine());

  /* -------------------------------------------------------------------------- */
  /*                                  SERVICES                                  */
  /* -------------------------------------------------------------------------- */

  injector.registerSingleton<GenericApiCallerService>(
    GenericApiCallerService(),
  );

  /* -------------------------------------------------------------------------- */
  /*                             REPOSITORIES                                   */
  /* -------------------------------------------------------------------------- */
  // Database
  // injector.registerSingletonAsync<AppDatabase>(
  //   () => DatabaseHelper.getDatabase(),
  // );

  // Local Data Sources
  // injector.registerLazySingleton<MovieLocalDataSource>(
  //   () => MovieLocalDataSourceImpl(database: injector<AppDatabase>()),
  // );
  //
  // // Remote Data Sources
  // injector.registerLazySingleton<MovieRemoteDataSource>(
  //   () => MovieRemoteDataSourceImpl(
  //     apiClient: injector<APIClient>(),
  //     apiConstants: injector<ApiConstants>(),
  //   ),
  // );

  // Repositories
  injector.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      apiClient: injector<APIClient>(),
      apiConstants: injector<ApiConstants>(),
    ),
  );

  injector.registerLazySingleton<WatchRepository>(
    () => WatchRepositoryImpl(
      apiClient: injector<APIClient>(),
      apiConstants: injector<ApiConstants>(),
    ),
  );

  injector.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(
      apiClient: injector<APIClient>(),
      apiConstants: injector<ApiConstants>(),
    ),
  );

  /* -------------------------------------------------------------------------- */
  /*                              USE CASES                                     */
  /* -------------------------------------------------------------------------- */
  injector.registerLazySingleton<GetUpcomingMoviesUseCase>(
    () => GetUpcomingMoviesUseCase(repository: injector<WatchRepository>()),
  );
  injector.registerLazySingleton<SearchMovieUseCase>(
    () => SearchMovieUseCase(repository: injector<SearchRepository>()),
  );
  injector.registerLazySingleton<GetMovieGenresUseCase>(
    () => GetMovieGenresUseCase(repository: injector<SearchRepository>()),
  );

  injector.registerLazySingleton<GetMovieDetailsUseCase>(
    () => GetMovieDetailsUseCase(repository: injector<MovieRepository>()),
  );

  injector.registerLazySingleton<GetMovieVideosUseCase>(
    () => GetMovieVideosUseCase(repository: injector<MovieRepository>()),
  );
  injector.registerLazySingleton<GetMovieImagesUseCase>(
    () => GetMovieImagesUseCase(repository: injector<MovieRepository>()),
  );


  /* -------------------------------------------------------------------------- */
  /*                              HOME FEATURE                                  */
  /* -------------------------------------------------------------------------- */

}
