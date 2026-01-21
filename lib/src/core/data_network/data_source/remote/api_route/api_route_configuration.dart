import 'package:dio/dio.dart';

/// An abstract class that defines the configuration for an API route.
///
/// This class provides a method to get the configuration for a request.
/// Implementations of this class should provide the specific details for
/// configuring the request options.
///
/// Methods:
/// - `getConfig`: Returns the [RequestOptions] for the API route configuration.
abstract class ApiRouteConfiguration {
  RequestOptions getConfig();
}
