import 'package:flutter/widgets.dart';

abstract class AppTextStyle {
  static const _defaultFamily = 'Inter';
  static const _defaultRegularFontWeight = FontWeight.w500;
  static const _defaultBoldFontWeight = FontWeight.w600;

  static const TextStyle regular = TextStyle(
    fontSize: 13,
    fontWeight: _defaultRegularFontWeight,
    fontFamily: _defaultFamily,
  );

  static const TextStyle bold = TextStyle(
    fontSize: 13,
    fontWeight: _defaultBoldFontWeight,
    fontFamily: _defaultFamily,
  );
}
