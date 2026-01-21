import '../decoder/decoder.dart';
import 'base_api_response.dart';

/// Generic API response with single object
class ApiResponse<T> extends BaseApiResponse<T>
    implements Decodable<ApiResponse<T>> {
  ApiResponse({required super.create});

  T? data;

  @override
  ApiResponse<T> decode(dynamic json) {
    if (json == null) {
      responseCode = '';
      responseMessage = '';
      status = '';
      data = null;
      return this;
    }

    final jsonMap = json as Map<String, dynamic>;

    // Check if this is a wrapped response (has responseCode)
    final hasResponseCode = jsonMap.containsKey('responseCode');

    if (hasResponseCode) {
      // Wrapped response format (existing behavior)
      // Only set values if they exist in the JSON
      if (jsonMap.containsKey('responseCode')) {
        responseCode = jsonMap['responseCode'];
      }
      if (jsonMap.containsKey('responseMessage')) {
        responseMessage = jsonMap['responseMessage'];
      }
      if (jsonMap.containsKey('status')) {
        status = jsonMap['status'];
      }

      // Try to extract data from 'data' or 'result' field
      if (jsonMap.containsKey('data') && jsonMap['data'] != null) {
        data = genericObject(jsonMap['data']);
      } else if (jsonMap.containsKey('result') && jsonMap['result'] != null) {
        data = genericObject(jsonMap['result']);
      } else {
        data = null;
      }
    } else {
      // Direct response format (TMDB style) - no responseCode
      // Set default success codes for direct responses
      responseCode = '200';
      responseMessage = 'Success';
      status = 'success';

      // For direct responses, the entire JSON might be the data object
      // Or it could be nested in common fields
      // Try common TMDB fields first, then root level
      if (jsonMap.containsKey('data') && jsonMap['data'] != null) {
        data = genericObject(jsonMap['data']);
      } else if (jsonMap.containsKey('result') && jsonMap['result'] != null) {
        data = genericObject(jsonMap['result']);
      } else {
        // For direct responses, try to decode the root object itself
        // This handles cases like direct movie object responses
        try {
          data = genericObject(jsonMap);
        } catch (e) {
          data = null;
        }
      }
    }

    return this;
  }

  /// == operator method to compare two ApiResponse objects
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiResponse<T> &&
        other.responseCode == responseCode &&
        other.responseMessage == responseMessage &&
        other.status == status &&
        other.data == data;
  }

  /// hashCode method to generate hashcode for ApiResponse object
  @override
  int get hashCode {
    return responseCode.hashCode ^
        responseMessage.hashCode ^
        status.hashCode ^
        data.hashCode;
  }
}
