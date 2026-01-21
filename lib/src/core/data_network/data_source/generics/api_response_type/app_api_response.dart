import 'package:adnan_movie_app_tentwenty_assignment/src/core/data_network/data_source/generics/wrapper/wrapper_response.dart';
import 'api_response.dart';
import 'api_list_response.dart';

/// Type alias for API response wrapper
/// This provides a consistent response structure across the app
/// Used for APIs that follow the standard responseCode/responseMessage pattern
typedef AppApiResponse<T> = ResponseWrapper<ApiResponse<T>>;

/// Type alias for API list response wrapper
/// Used for APIs that follow the standard responseCode/responseMessage pattern
typedef AppApiListResponse<T> = ResponseWrapper<ApiListResponse<T>>;

/// Type alias for direct response wrapper (for APIs like TMDB that don't use responseCode/responseMessage)
/// Used for APIs that return data directly without wrapping in responseCode/responseMessage
typedef AppDirectResponse<T> = ResponseWrapper<T>;

typedef ApiListResponseSuccessCallback<T> =
    void Function({required List<T?>? successResponse, String? responseCode, String? responseMessage});

typedef ApiListResponseFailureCallback = void Function({required String errorResponse, String? responseCode});

typedef ApiResponseSuccessCallback<T> =
    void Function({required T? successResponse, String? responseCode, String? responseMessage});

typedef ApiResponseFailureCallback = void Function({required String errorResponse, String? responseCode});
