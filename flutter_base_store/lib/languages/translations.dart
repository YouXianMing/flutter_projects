import 'package:project_base_libs_pkg/third_lib_get.dart';
import 'arabs_translations.dart';
import 'english_translations.dart';
import 'chinese_translations.dart';

/// Getx的语言翻译AppTranslations
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': englishTranslations,
        'zh_CN': chineseTranslations,
        'ar_AE': arabsTranslations,
      };
}
