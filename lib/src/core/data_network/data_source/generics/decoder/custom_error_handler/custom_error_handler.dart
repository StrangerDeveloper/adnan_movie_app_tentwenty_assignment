/// A class that handles API response errors and returns an appropriate
/// [ErrorResponse] based on the provided status code.
///
/// The [handle] method takes an HTTP status code and an optional
/// [ErrorResponse] object, and returns an [ErrorResponse] with a
/// corresponding error message.
///
/// Supported status codes:
/// - 401: Unauthorized - Session expired. Please log in again.
/// - 403: Forbidden - You don't have permission to access this resource.
/// - 404: Resource Not Found - Please try again later.
/// - 500: Server Error - Please try again later.
/// - 1558: Region Not Valid - Uses the message from the provided
///   [ErrorResponse] or a default message.
///
/// For any other status code, it returns an "Unexpected Error" message
/// with the provided status code.
library;

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/logs/logs_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';

import '../../api_response_type/error_response.dart';

class ApiResponseErrorHandler {
  static ErrorResponse handle(int statusCode, {ErrorResponse? errorResponse}) {
    String message;

    switch (statusCode) {
      case 401:
        message = injectedAppTranslationKeys.unauthorizedSessionExpired.translate;
        break;
      case 403:
        message = injectedAppTranslationKeys.noPermissionToAccess.translate;
        break;
      case 404:
        message = injectedAppTranslationKeys.resourceNotFoundPleaseTryAgainLater.translate;
        break;
      case 500:
        message = injectedAppTranslationKeys.serverErrorPleaseTryAgainLater.translate;
        break;
      default:
        message = injectedAppTranslationKeys.unexpectedError.translate;
    }

    return ErrorResponse(message: '$message [$statusCode]', responseCode: statusCode.toString());
  }

  /// Handle the response based on the internal API response code
  static ErrorResponse? handleResponse({Map<String, dynamic>? json}) {
    final errorResponse = ErrorResponse.fromJson(json);
    switch (errorResponse.responseCode) {
      // Invalid Token (Expired or Invalid value)
      case '757':
        "Handle 757".logL();

        // Return the error response with a custom message
        return errorResponse.copyWith(message: injectedAppTranslationKeys.somethingWentWrong);
      default:
        "Handle ${errorResponse.responseCode}".logL();
        return errorResponse;
    }
  }
}
