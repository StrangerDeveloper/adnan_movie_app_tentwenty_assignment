
import '../decoder/decoder.dart';
import 'base_api_response.dart';

/// Generic API response with list of objects
class ApiListResponse<T> extends BaseApiResponse<T> implements Decodable<ApiListResponse<T>> {
  List<T>? data;

  ApiListResponse({
    required super.create,
  });

  @override
  ApiListResponse<T> decode(dynamic json) {
    if (json == null) {
      responseCode = '';
      responseMessage = '';
      status = '';
      data = [];
      return this;
    }

    // Check if root is a direct list (direct array response)
    if (json is List) {
      // Direct array response - no wrapping
      responseCode = '200';
      responseMessage = 'Success';
      status = 'success';
      data = [];
      for (var item in json) {
        try {
          data!.add(genericObject(item));
        } catch (e) {
          // Skip invalid items
          continue;
        }
      }
      return this;
    }

    // Otherwise, treat as Map
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
      
      // Try to extract list from 'result' or 'data' field
      List<dynamic>? listData;
      if (jsonMap.containsKey('result') && jsonMap['result'] != null) {
        listData = jsonMap['result'] as List<dynamic>?;
      } else if (jsonMap.containsKey('data') && jsonMap['data'] != null) {
        final dataValue = jsonMap['data'];
        if (dataValue is List) {
          listData = dataValue;
        }
      }
      
      data = [];
      if (listData != null) {
        for (var item in listData) {
          try {
            data!.add(genericObject(item));
          } catch (e) {
            // Skip invalid items
            continue;
          }
        }
      }
    } else {
      // Direct response format (TMDB style) - no responseCode
      // Set default success codes for direct responses
      responseCode = '200';
      responseMessage = 'Success';
      status = 'success';
      
      // Try to find list in common TMDB fields
      List<dynamic>? listData;
      
      // Check for 'results' field (TMDB discover/search format)
      if (jsonMap.containsKey('results') && jsonMap['results'] != null) {
        listData = jsonMap['results'] as List<dynamic>?;
      }
      // Check for 'genres' field (TMDB genres format)
      else if (jsonMap.containsKey('genres') && jsonMap['genres'] != null) {
        listData = jsonMap['genres'] as List<dynamic>?;
      }
      // Check for 'result' field (fallback)
      else if (jsonMap.containsKey('result') && jsonMap['result'] != null) {
        final resultValue = jsonMap['result'];
        if (resultValue is List) {
          listData = resultValue;
        }
      }
      // Check for 'data' field (fallback)
      else if (jsonMap.containsKey('data') && jsonMap['data'] != null) {
        final dataValue = jsonMap['data'];
        if (dataValue is List) {
          listData = dataValue;
        }
      }
      
      data = [];
      if (listData != null) {
        for (var item in listData) {
          try {
            data!.add(genericObject(item));
          } catch (e) {
            // Skip invalid items
            continue;
          }
        }
      }
      
      // Note: Pagination fields (page, total_pages, total_results) are available
      // in jsonMap but not stored here. They can be accessed from the repository
      // if needed by creating a separate paginated response model.
    }
    
    return this;
  }
}
