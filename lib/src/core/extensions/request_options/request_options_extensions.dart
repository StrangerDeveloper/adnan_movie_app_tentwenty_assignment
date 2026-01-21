import 'package:dio/dio.dart';

/// Extension on `RequestOptions` to set base configurations.
///
/// This extension provides a method to set the base configurations for
/// `RequestOptions` such as `baseUrl`, `connectTimeout`, `receiveTimeout`,
/// and `validateStatus`.
/// Sets the base configurations for `RequestOptions`.
///
/// - Parameters:
///   - baseUrl: The base URL for the request. Defaults to an empty string if not provided.
///   - connectTimeout: The connection timeout duration in milliseconds. Defaults to 60000 milliseconds if not provided.
///   - receiveTimeout: The receive timeout duration in milliseconds. Defaults to 60000 milliseconds if not provided.
///   - validateStatus: A function to validate the status code. Defaults to allowing status codes up to 502.
///
/// - Returns: The updated `RequestOptions` instance with the specified configurations.
///
extension BaseRequestOptions on RequestOptions {
  RequestOptions setBaseConfigs({
    String? baseUrl,
    int? connectTimeout,
    int? receiveTimeout,
    bool Function(int?)? validateStatus,
  }) {
    this.baseUrl = baseUrl ?? "";
    this.connectTimeout = Duration(hours: connectTimeout ?? 1);
    this.receiveTimeout = Duration(hours: receiveTimeout ?? 1);
    this.validateStatus = (status) => status! <= 502;
    return this;
  }
}
