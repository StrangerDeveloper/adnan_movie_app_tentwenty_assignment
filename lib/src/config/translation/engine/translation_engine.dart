import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';

class TranslationEngine {


  /* -------------------------------------------------------------------------- */
  /*                                  VARIABLES                                 */
  /* -------------------------------------------------------------------------- */

  ///
  /// This private method mapping all of the available language's translations
  ///
  final Map<String, Map<String, dynamic>> _localizedValues = {
    'en': injectedEnglish.english,
    //'ar': injector<Arabic>().arabic,
  };


  ///
  /// This method will give translation against [key] from
  /// available hashmap of currently selected language
  ///
  String getTranslation(String key, [String? langKey]) => _localizedValues[langKey ?? "en"]?[key] ?? key;

}