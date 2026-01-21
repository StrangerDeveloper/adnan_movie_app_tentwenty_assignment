import 'package:adnan_movie_app_tentwenty_assignment/src/core/type_defs/create_response.dart';

import '../api_response_type/api_list_response.dart';
import '../api_response_type/api_response.dart';
import '../api_response_type/base_api_response.dart';
import '../api_response_type/error_response.dart';
import '../decoder/custom_error_handler/custom_error_handler.dart';
import '../decoder/decoder.dart';
import 'generic_object.dart';

/// A wrapper class for handling success and error responses.
class ResponseWrapper<T> extends GenericObject<T> {
  /// Constructs a [ResponseWrapper] with the given [create] function and optional [error].
  ResponseWrapper({required super.create, this.error});

  /// The data_network of the response, which can be of any type [T].
  T? data;

  /// The error response, if any.
  ErrorResponse? error;

  /// Factory constructor for initializing a [ResponseWrapper] with the given [create] function and optional [json] data_network.
  ///
  /// The [create] parameter is a required function that creates a response of type [Decodable].
  /// The [json] parameter is an optional map containing the JSON data_network to be decoded.
  factory ResponseWrapper.init({
    required CreateResponse<Decodable> create,
    Map<String, dynamic>? json,
  }) {
    // Getting wrapper object (self)
    final wrapper = ResponseWrapper<T>(create: create);

    // Decode JSON data_network into a generic object
    wrapper.data = wrapper.genericObject(json);

    // Check if the data_network is an instance of ApiResponse or ApiListResponse
    if (wrapper.data is ApiResponse || wrapper.data is ApiListResponse) {
      final finalResponse = wrapper.data as BaseApiResponse;

      // Only validate responseCode if it exists and is not empty
      // For wrapped responses: responseCode comes from JSON
      // For direct responses (TMDB): responseCode is set to '200' by default
      // Empty string means responseCode wasn't present in JSON and wasn't set
      if (finalResponse.responseCode != null &&
          finalResponse.responseCode!.isNotEmpty) {
        // Check if the response code indicates an error
        // Success codes: '00' or '200'
        if (finalResponse.responseCode != '00' &&
            finalResponse.responseCode != '200') {
          wrapper.error = ApiResponseErrorHandler.handleResponse(json: json);
        }
      }
      // If responseCode is null or empty, treat as success
      // This handles direct responses where HTTP status code (200) indicates success
      // The APIClient already validates HTTP status codes before calling this
    }

    return wrapper;
  }

  /// == operator for comparing two [ResponseWrapper] objects.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseWrapper<T> &&
        other.data == data &&
        other.error == error;
  }

  /// Hash code for the [ResponseWrapper] object.
  @override
  int get hashCode => data.hashCode ^ error.hashCode;
}
