/// A utility class to handle Dio exceptions and return standardized error responses.
///
/// This class provides a static method to handle various types of Dio exceptions
/// and convert them into a standardized `ErrorResponse` object with appropriate
/// error messages.
///
/// Usage:
/// ```dart
/// try {
/// } on DioException catch (e) {
///   final errorResponse = DioExceptionHandler.handle(e);
/// }
/// ```
///
/// The following Dio exception types are handled:
/// - `DioExceptionType.connectionTimeout`: Connection timed out.
/// - `DioExceptionType.sendTimeout`: Request send timed out.
/// - `DioExceptionType.receiveTimeout`: Response timed out.
/// - `DioExceptionType.badResponse`: Server response errors (e.g., 404, 500).
/// - `DioExceptionType.cancel`: Request was cancelled.
/// - `DioExceptionType.unknown`: Other types of exceptions, such as network issues.
///
/// The method returns an `ErrorResponse` object with a message describing the error.
///
library;
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/logs/logs_ext.dart';
import 'package:dio/dio.dart';

import '../api_response_type/error_response.dart';

class DioExceptionHandler {
  /// Handles Dio exceptions and returns a standardized ErrorResponse
  static ErrorResponse handle(DioException exception) {
    exception.logL();
    String errorMessage;

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timed out. Please check your network.';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Request send timed out. Please try again.';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Response timed out. Please try again later.';
        break;
      case DioExceptionType.badResponse:
        if (exception.response != null) {
          errorMessage = 'Received invalid status code: ${exception.response?.statusCode}';
        } else {
          errorMessage = 'Unknown server error occurred.';
        }
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request was cancelled. Please try again.';
        break;
      case DioExceptionType.unknown:
        if (exception.message?.contains('SocketException') ?? false) {
          errorMessage = 'No internet connection. Please try again.';
        } else {
          errorMessage = 'Network error. Please check your internet connection.';
        }
        break;
      default:
        errorMessage = 'An unexpected error occurred.';
    }

    return ErrorResponse(message: errorMessage);
  }
}
