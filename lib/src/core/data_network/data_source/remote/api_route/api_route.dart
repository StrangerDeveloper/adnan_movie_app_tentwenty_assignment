import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/extensions/request_options/request_options_extensions.dart';
import 'package:dio/dio.dart';

import 'api_route_configuration.dart';

/// Configures API routes with path, method, headers, and data_network
/// A class that represents an API route configuration.
///
/// This class implements the [ApiRouteConfiguration] interface and provides
/// the necessary details for configuring an API route, such as the path,
/// method, headers, parameters, and data_network.
///
/// The [ApiRoute] class is used to create an instance of an API route with
/// the specified configuration and provides a method to get the request
/// options for the route.
///
/// Example usage:
/// ```dart
/// final apiRoute = ApiRoute(
///   path: '/example',
///   method: 'GET',
///   headers: {'Authorization': 'Bearer token'},
///   params: {'query': 'value'},
///   data_network: {'key': 'value'},
/// );
/// ```
///
/// Properties:
/// - `path`: The path of the API route.
/// - `method`: The HTTP method for the API route (e.g., GET, POST).
/// - `headers`: Optional headers to include in the request.
/// - `params`: Optional query parameters to include in the request.
/// - `data_network`: Optional data_network to include in the request body.
///
/// Methods:
/// - `getConfig()`: Returns the [RequestOptions] configured with the API route
///   details and base configurations.
class ApiRoute implements ApiRouteConfiguration {
  final String path;
  final String method;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? params;
  final dynamic data;
  final String? baseUrl;

  ApiRoute({
    required this.path,
    required this.method,
    this.headers,
    this.params,
    this.data,
    this.baseUrl,
  });

  @override
  RequestOptions getConfig() {

    return RequestOptions(
      path: path,
      headers: headers,
      data: data,
      queryParameters: params,
      method: method,
    ).setBaseConfigs(baseUrl: baseUrl ?? injectedApiConstants.baseUrl);
  }
}
