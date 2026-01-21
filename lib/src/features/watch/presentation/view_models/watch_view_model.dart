import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/logs/logs_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/entities/movie_entity.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/features/watch/domain/use_cases/get_upcoming_movies_use_case.dart';
import 'package:flutter/foundation.dart';

/// ViewModel for Watch screen
class WatchViewModel extends ChangeNotifier {
  WatchViewModel() {
    loadUpcomingMovies();
  }

  /* -------------------------------------------------------------------------- */
  /*                                  DATA                                      */
  /* -------------------------------------------------------------------------- */
  List<MovieEntity?> upcomingMovies = [];

  /* -------------------------------------------------------------------------- */
  /*                                  API METHODS                               */
  /* -------------------------------------------------------------------------- */
  Future<void> loadUpcomingMovies() async {
    //params
    final params = {"page": "1", "limit": "5"};

    await injectedApiCallService.callListApi(
      useCase: injector<GetUpcomingMoviesUseCase>(),
      params: params,
      onSuccess: ({responseCode, responseMessage, required successResponse}) {
        upcomingMovies = successResponse ?? [];
      },
      onFailure: ({required errorResponse, responseCode}) {
        "Error: $errorResponse".logError();
      },
    );
    debugPrint("Upcoming movies loaded: ${upcomingMovies.length}");
    notifyListeners();
  }

  /* -------------------------------------------------------------------------- */
  /*                                  DISPOSE                                   */
  /* -------------------------------------------------------------------------- */
  @override
  void dispose() {
    // Clean up resources if needed
    super.dispose();
  }
}
