/// Decodable interface for parsing JSON data_network.
abstract class Decodable<T> {
  T decode(dynamic json);
}
