import 'package:dartweek_fwc/app/core/ui/styles/colors_app.dart';
import 'package:flutter/widgets.dart';

class TextStyles {
  static TextStyles? _instance;
  // Avoid self isntance
  TextStyles._();
  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Poppins';
  String get secondaryFont => 'MPlus1P';

  TextStyle get textPrimaryFontRegular => TextStyle(
        fontFamily: primaryFont,
        fontWeight: FontWeight.normal,
      );

  TextStyle get textPrimaryFontMedium => TextStyle(
        fontFamily: primaryFont,
        fontWeight: FontWeight.w500,
      );

  TextStyle get textPrimaryFontSemiBold => TextStyle(
        fontFamily: primaryFont,
        fontWeight: FontWeight.w600,
      );

  TextStyle get textPrimaryFontBold => TextStyle(
        fontFamily: primaryFont,
        fontWeight: FontWeight.bold,
      );

  TextStyle get textPrimaryFontExtraBold => TextStyle(
        fontFamily: primaryFont,
        fontWeight: FontWeight.w800,
      );

  TextStyle get textSecondaryFontRegular => TextStyle(
        fontFamily: secondaryFont,
        fontWeight: FontWeight.normal,
      );

  TextStyle get textSecondaryFontMedium => TextStyle(
        fontFamily: secondaryFont,
        fontWeight: FontWeight.w500,
      );

  TextStyle get textSecondaryFontBold => TextStyle(
        fontFamily: secondaryFont,
        fontWeight: FontWeight.bold,
      );

  TextStyle get textSecondaryFontExtraBold => TextStyle(
        fontFamily: secondaryFont,
        fontWeight: FontWeight.w800,
      );

  TextStyle get labelTextField =>
      textSecondaryFontRegular.copyWith(color: ColorsApp.instance.darkGrey);

  TextStyle get textSecondaryFontExtraBoldPrimaryColor =>
      textSecondaryFontExtraBold.copyWith(color: ColorsApp.instance.primary);
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
