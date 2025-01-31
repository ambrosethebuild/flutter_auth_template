import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en_us") +
      {
        "en_us": "Hello, how are you?",
        "pt_br": "Olá, como vai você?",
      };

  String get i18n => localize(this, _t);
}
