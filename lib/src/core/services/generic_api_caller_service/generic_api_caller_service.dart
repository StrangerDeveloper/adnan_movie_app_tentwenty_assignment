

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/api_response_type/app_api_response.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/domain/use_case/use_case.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/logs/logs_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';

class GenericApiCallerService {
  Future<void> callApi<EntityType, Params>({
    required UseCase<AppApiResponse<EntityType?>, Params> useCase,
    required Params params,
    required ApiResponseSuccessCallback<EntityType> onSuccess,
    ApiResponseFailureCallback? onFailure,
    final bool showAndHideLoader = false,
    String? loaderText,
  }) async {
    try {
      // if (showAndHideLoader) {
      //   // Show loader
      //   injectedLoaderStateService.showLoader(
      //     text: loaderText,
      //   );
      // }

      // Call the use case
      final response = await useCase.call(params: params);

      // Hide loader
      // if (showAndHideLoader) {
      //   injectedLoaderStateService.hideLoader();
      // }

      // Handle success or error based on response
      // First check for explicit errors
      if (response.error != null) {
        final errorMessage = response.error?.message ?? injectedAppTranslationKeys.somethingWentWrong.translate;
        "Api Error: $errorMessage".logError();
        // Invoke the failure callback with error message
        onFailure?.call(
          errorResponse: errorMessage,
          responseCode: response.error?.responseCode,
        );
        return;
      }
      
      // Check responseCode if it exists (for wrapped responses)
      final responseCode = response.data?.responseCode;
      final hasResponseCode = responseCode != null && responseCode.isNotEmpty;
      
      if (hasResponseCode) {
        // Wrapped response format - validate responseCode
        final hasSuccessCode = responseCode == "00" || responseCode == "200";
        if (hasSuccessCode) {
          // Invoke the success callback with response
          onSuccess(
            successResponse: response.data?.data,
            responseCode: responseCode,
            responseMessage: response.data?.responseMessage,
          );
        } else {
          // Invalid response code
          onFailure?.call(
            errorResponse: response.data?.responseMessage ?? 
                injectedAppTranslationKeys.somethingWentWrong.translate,
            responseCode: responseCode,
          );
        }
      } else {
        // Direct response format (TMDB) - no responseCode, treat as success
        // HTTP status code validation already handled by APIClient
        onSuccess(
          successResponse: response.data?.data,
          responseCode: null,
          responseMessage: null,
        );
      }
    } catch (e) {
      // Hide loader
      // if (showAndHideLoader) {
      //   injectedLoaderStateService.hideLoader();
      // }

      "Error: $e".logError();
      // Invoke failure callback with exception message
      onFailure?.call(errorResponse: e.toString());
    }
  }

  Future<void> callListApi<EntityType, Params>({
    required UseCase<AppApiListResponse<EntityType?>, Params> useCase,
    required Params params,
    required ApiListResponseSuccessCallback<EntityType> onSuccess,
    ApiListResponseFailureCallback? onFailure,
    final bool showAndHideLoader = false,
    String? loaderText,
  }) async {
    try {
      // if (showAndHideLoader) {
      //   // Show loader
      //   injectedLoaderStateService.showLoader(
      //     text: loaderText,
      //   );
      // }

      // Call the use case
      final response = await useCase.call(params: params);

      // Hide loader
      // if (showAndHideLoader) {
      //   injectedLoaderStateService.hideLoader();
      // }

      // Handle success or error based on response
      // First check for explicit errors
      if (response.error != null) {
        final errorMessage = response.error?.message ?? injectedAppTranslationKeys.somethingWentWrong.translate;
        "Api Error: $errorMessage".logError();
        // Invoke the failure callback with error message
        onFailure?.call(
          errorResponse: errorMessage,
          responseCode: response.error?.responseCode,
        );
        return;
      }
      
      // Check responseCode if it exists (for wrapped responses)
      final responseCode = response.data?.responseCode;
      final hasResponseCode = responseCode != null && responseCode.isNotEmpty;
      
      if (hasResponseCode) {
        // Wrapped response format - validate responseCode
        final hasSuccessCode = responseCode == "00" || responseCode == "200";
        if (hasSuccessCode) {
          // Invoke the success callback with response
          onSuccess(
            successResponse: response.data?.data,
            responseCode: responseCode,
            responseMessage: response.data?.responseMessage,
          );
        } else {
          // Invalid response code
          onFailure?.call(
            errorResponse: response.data?.responseMessage ?? 
                injectedAppTranslationKeys.somethingWentWrong.translate,
            responseCode: responseCode,
          );
        }
      } else {
        // Direct response format (TMDB) - no responseCode, treat as success
        // HTTP status code validation already handled by APIClient
        onSuccess(
          successResponse: response.data?.data,
          responseCode: null,
          responseMessage: null,
        );
      }
    } catch (e) {
      // Hide loader
      // if (showAndHideLoader) {
      //   injectedLoaderStateService.hideLoader();
      // }

      "Error: $e".logError();
      // Invoke failure callback with exception message
      onFailure?.call(errorResponse: e.toString());
    }
  }
}
