import 'package:adnan_movie_app_tentwenty_assignment/src/core/type_defs/create_response.dart';

import '../decoder/decoder.dart';


///
/// Generic abstract object class for decoding JSON
///
abstract class GenericObject<T> {
  /// Public constructor
  GenericObject({required this.create});

  /// Create function instance for decoding JSON
  CreateResponse<Decodable> create;

  /// Decode JSON data_network into a generic object
  T genericObject(dynamic data) {
    final item = create();
    return item.decode(data);
  }
}
