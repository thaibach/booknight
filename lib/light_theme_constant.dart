import 'package:flutter/material.dart';

@immutable
class CustomThemes extends ThemeExtension<CustomThemes> {
  const CustomThemes({
    required this.loadingProgressIndicator,
    required this.brandColor,
    required this.appBarColor,
    required this.textColor,
    required this.backgroundColor,
    required this.appBartextColor,
  });

  final Color? loadingProgressIndicator;
  final Color? brandColor;
  final Color? appBarColor;
  final Color? appBartextColor;
  final Color? textColor;
  final Color? backgroundColor;

  @override
  CustomThemes copyWith({
    Color? loadingProgressIndicator,
    Color? brandColor,
    Color? appBarColor,
    Color? textColor,
    Color? backgroundColor,
    Color? appBartextColor,
  }) {
    return CustomThemes(
      loadingProgressIndicator: loadingProgressIndicator ?? this.loadingProgressIndicator,
      brandColor: brandColor ?? this.brandColor,
      appBarColor: appBarColor ?? this.appBarColor,
      textColor: textColor ?? this.textColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      appBartextColor: appBartextColor ?? this.appBartextColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  CustomThemes lerp(ThemeExtension<CustomThemes>? other, double t) {
    if (other is! CustomThemes) {
      return this;
    }
    return CustomThemes(
      loadingProgressIndicator: Color.lerp(loadingProgressIndicator, other.loadingProgressIndicator, t),
      brandColor: Color.lerp(brandColor, other.brandColor, t),
      appBarColor: Color.lerp(appBarColor, other.appBarColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      appBartextColor: Color.lerp(appBartextColor, other.appBartextColor, t),
    );
  }

/*  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'CustomColors('
      'loadingProgressIndicator: $loadingProgressIndicator, info: $brandColor, warning: $info, danger: $danger'
      ')';*/
  // the light theme
  static final white = CustomThemes(
    loadingProgressIndicator: Color(0xff6ECCAF),
    brandColor: Color(0xff6ECCAF),
    textColor: Colors.black,
    appBarColor: Colors.black.withOpacity(0.25),
    appBartextColor: Colors.black.withOpacity(0.25),
    backgroundColor: Colors.white,
  );

  // the dark theme
  static final yellow = CustomThemes(
    loadingProgressIndicator: Colors.yellowAccent,
    brandColor: Color(0xffE5E5CB),
    textColor: Colors.white,
    appBarColor: Colors.black.withOpacity(0.25),
    appBartextColor: Colors.black.withOpacity(0.25),
    backgroundColor: Color(0xffFFED50),
    // brandColor: Color(0xff6B728E)
  );
  // the dark theme
  static final amber = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xffFFCC4A));

  static final orange = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xffFC7A31));

  static final red = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xffFF4545));

  static final pink = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xffF1578F));

  static final deep_link = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xffD44478));

  static final purple = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xffCD41FF));

  static final deep_purple = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xff8941FF));

  static final indigo = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xff8941FF));

  static final cyan = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xff48DEFF));

  static final blue = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xff0DB6FF));

  static final emerald = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xff00B49F));

  static final green = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xff0BD81F));

  static final light_green = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xff5DFF35));

  static final lime = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xffB6FF59));

  static final gray = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Colors.black.withOpacity(0.25),
      appBartextColor: Colors.black.withOpacity(0.25),
      backgroundColor: Color(0xffBEBEBE));
}
