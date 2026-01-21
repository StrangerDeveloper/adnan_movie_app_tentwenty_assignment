import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';

/// Extension to handle translation engine on String keys
/// Use this extension for quick translations: 'key'.translate
extension TranslationExt on String {
  /// Get translation for this key
  String get translate => injectedTranslationEngine.getTranslation(this);

  /// Get translation for this key with specific language
  String getTranslationViaLangKey({required String langKey}) =>
      injectedTranslationEngine.getTranslation(this, langKey);
}
