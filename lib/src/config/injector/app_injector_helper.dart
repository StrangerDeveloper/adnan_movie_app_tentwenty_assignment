import 'package:adnan_movie_app_tentwenty_assignment/src/config/translation/app_text_styles/app_text_styles.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/config/translation/engine/translation_engine.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/config/translation/english/en.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/constants/api_constants/api_constants.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/constants/app_assets/app_icons.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/constants/app_colors/app_colors.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/constants/app_keys/app_translations_keys.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/services/generic_api_caller_service/generic_api_caller_service.dart';
import 'package:adnan_movie_app_tentwenty_assignment/src/core/shared/utils/image_url_helper.dart';
import 'app_injector.dart';

ApiConstants get injectedApiConstants => injector<ApiConstants>();

AppColors get injectedAppColors => injector<AppColors>();

AppTranslationsKeys get injectedAppTranslationKeys => injector<AppTranslationsKeys>();

English get injectedEnglish => injector<English>();

TranslationEngine get injectedTranslationEngine => injector<TranslationEngine>();

AppIcons get injectedAppIcons => injector<AppIcons>();

ImageUrlHelper get injectedImageHelper => injector<ImageUrlHelper>();

AppTextStyles get injectedTextStyles => injector<AppTextStyles>();

GenericApiCallerService get injectedApiCallService => injector<GenericApiCallerService>();
