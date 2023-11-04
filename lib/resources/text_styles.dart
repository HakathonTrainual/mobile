import 'package:flutter/widgets.dart';

abstract class AppTextStyle {
  static const _defaultFamily = 'Mulish';
  static const _defaultRegularFontWeight = FontWeight.w400;
  static const _defaultSemiBoldFontWeight = FontWeight.w600;
  static const _defaultBoldFontWeight = FontWeight.w800;

  static const TextStyle regular = TextStyle(
    fontSize: 13,
    fontWeight: _defaultRegularFontWeight,
    fontFamily: _defaultFamily,
  );

  static const TextStyle semiBold = TextStyle(
    fontSize: 13,
    fontWeight: _defaultSemiBoldFontWeight,
    fontFamily: _defaultFamily,
  );

  static const TextStyle bold = TextStyle(
    fontSize: 13,
    fontWeight: _defaultBoldFontWeight,
    fontFamily: _defaultFamily,
  );
}
