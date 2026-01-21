import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/logs/logs_ext.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/interceptors/logger_interceptor.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/type_defs/create_response.dart';
import 'package:dio/dio.dart';

import '../../generics/api_response_type/error_response.dart';
import '../../generics/decoder/custom_error_handler/custom_error_handler.dart';
import '../../generics/decoder/decoder.dart';
import '../../generics/dio_exception_handler/dio_exception_handler.dart';
import '../../generics/wrapper/wrapper_response.dart';
import '../api_route/api_route_configuration.dart';

class APIClient {
  final Dio dio;

  APIClient({required this.dio}) {
    _initializeInterceptors();
    //_initializeCertificates();
  }

  /// Initialize interceptors for Dio instance
  void _initializeInterceptors() {
    dio.interceptors.addAll([
      LoggerInterceptor(), // For logging
    ]);
  }

  /// Generic request method using ApiRouteConfiguration
  Future<ResponseWrapper<T>> request<T extends Decodable>({
    required ApiRouteConfiguration config,
    required CreateResponse<Decodable> create,
  }) async {
    try {
      // Get the request configuration from the provided ApiRouteConfiguration
      final requestOptions = config.getConfig();

      // Log the api request to analytics
      _logApiRequestAnalytics(requestOptions);

      // Call the api using Dio
      final response = await dio.fetch(requestOptions);

      // Check if the response is successful (200)
      if (response.statusCode == 200) {
        // Create a ResponseWrapper object from the response
        final ResponseWrapper<T> responseWrapper = ResponseWrapper.init(
          create: create,
          json: response.data,
        );

        return responseWrapper;
      } else {
        // Handle the error response (other than 200)
        throw ApiResponseErrorHandler.handle(response.statusCode ?? 0);
      }
    } on DioException catch (e) {
      // Handle DioException
      final dioException = DioExceptionHandler.handle(e);
      throw ErrorResponse(
        message: dioException.message,
        responseCode: dioException.responseCode,
      );
    } catch (e) {
      e.logError();
      rethrow;
    }
  }

  ///
  /// Log the event for api call analytics
  /// store the body and path in the analytics
  ///
  void _logApiRequestAnalytics(RequestOptions requestOptions) {
    // injectedAnalyticsService.logEvent(
    //   event: requestOptions.path.split('/').last,
    //   action: requestOptions.path,
    //   value: requestOptions.baseUrl,
    // );
  }
}
