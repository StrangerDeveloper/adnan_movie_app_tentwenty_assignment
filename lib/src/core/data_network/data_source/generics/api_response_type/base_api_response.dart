
import '../wrapper/generic_object.dart';

abstract class BaseApiResponse<T> extends GenericObject<T> {
  BaseApiResponse({required super.create});

  String? responseCode;
  String? responseMessage;
  String? status;
}
