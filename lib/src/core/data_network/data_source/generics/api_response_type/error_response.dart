import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/translation_ext/translation_ext.dart';

/// Error response for handling API errors
class ErrorResponse implements Exception {
  final String message;
  final String? responseCode;

  ErrorResponse({
    required this.message,
    this.responseCode,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic>? json) {
    return ErrorResponse(
      message: json?['responseMessage'] ?? injectedAppTranslationKeys.somethingWentWrong.translate,
      responseCode: json?['responseCode'] ?? '-1',
    );
  }

  ErrorResponse copyWith({
    String? message,
    String? responseCode,
  }) {
    return ErrorResponse(
      message: message ?? this.message,
      responseCode: responseCode ?? this.responseCode,
    );
  }

  @override
  String toString() => message;
}
