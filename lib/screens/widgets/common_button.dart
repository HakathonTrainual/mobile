import 'package:flutter/material.dart';
import 'package:hackathon_trainual_mobile/resources/color_styles.dart';
import 'package:hackathon_trainual_mobile/resources/text_styles.dart';

const _defaultPadding = EdgeInsets.symmetric(vertical: 14);

const double _wrapContent = 0;
const double _matchParent = double.infinity;
const double _heightSmall = 32;
const double _heightMedium = 42;
const double _heightLarge = 52;

const double _defaultPrefixSpace = 4;
const double _defaultSuffixSpace = 4;

const _backgroundColorDisabled = Colors.grey;
const _textColorDisabled = AppColors.textSecondaryGray;
const _textColorDark = AppColors.textPrimaryWhite;
const _textColorLight = AppColors.textPrimaryLicorice;

class CommonButtonSizePreset extends Size {
  const CommonButtonSizePreset(super.width, super.height);

  const CommonButtonSizePreset.small(double width) : this(width, _heightSmall);

  const CommonButtonSizePreset.medium(double width)
      : this(width, _heightMedium);

  const CommonButtonSizePreset.large(double width) : this(width, _heightLarge);

  const CommonButtonSizePreset.largeMatchParent() : this.large(_matchParent);

  const CommonButtonSizePreset.largeWrapContent() : this.large(_wrapContent);
}

class CommonButtonColorScheme {
  final Color backgroundColor;
  final Color backgroundColorPressed;
  final Color backgroundColorDisabled;
  final Color textColor;
  final Color textColorDisabled;

  const CommonButtonColorScheme({
    required this.backgroundColor,
    required this.backgroundColorPressed,
    required this.backgroundColorDisabled,
    required this.textColor,
    required this.textColorDisabled,
  });

  CommonButtonColorScheme.primary()
      : this(
          backgroundColor: AppColors.primary,
          backgroundColorPressed: AppColors.primary.withOpacity(.9),
          backgroundColorDisabled: _backgroundColorDisabled,
          textColor: AppColors.textPrimaryWhite,
          textColorDisabled: AppColors.textPrimaryWhite,
        );
}

class CommonButton extends StatelessWidget {
  final CommonButtonColorScheme colorScheme;

  /// Has higher priority over [shapePreset]
  final OutlinedBorder? customShape;

  final Size size;

  /// Internal padding around text with suffix and prefix
  /// If null then [_calculatedPadding] will be used
  final EdgeInsets? padding;

  final String text;

  /// If null then [_calculatedFontSize] will be used
  final double? fontSize;

  /// Widget that displayed left to the text
  final Widget? prefix;

  /// Space between text and prefix
  final double prefixSpace;

  /// Widget that displayed right to the text
  final Widget? suffix;

  /// Space between text and suffix
  final double suffixSpace;

  /// If null, then button will appear and behave as disabled
  final VoidCallback? onPressed;

  const CommonButton({
    super.key,
    this.customShape,
    required this.colorScheme,
    this.size = const CommonButtonSizePreset.largeMatchParent(),
    this.padding,
    required this.text,
    this.fontSize,
    this.prefix,
    this.prefixSpace = _defaultPrefixSpace,
    this.suffix,
    this.suffixSpace = _defaultSuffixSpace,
    required this.onPressed,
  });

  CommonButton.primary({
    Key? key,
    Size size = const CommonButtonSizePreset.largeMatchParent(),
    required String text,
    Widget? prefix,
    double prefixSpace = _defaultPrefixSpace,
    Widget? suffix,
    double suffixSpace = _defaultSuffixSpace,
    VoidCallback? onPressed,
  }) : this(
          key: key,
          colorScheme: CommonButtonColorScheme.primary(),
          size: size,
          text: text,
          prefix: prefix,
          prefixSpace: prefixSpace,
          suffix: suffix,
          suffixSpace: suffixSpace,
          onPressed: onPressed,
        );

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: onPressed != null
              ? colorScheme.backgroundColor
              : colorScheme.backgroundColorDisabled,
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(80)),
          ),
          minimumSize: size,
          elevation: 0,
          padding: padding ??
              const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 32,
              ),
          foregroundColor: colorScheme.backgroundColorPressed,
          shadowColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (prefix != null) ...[
              prefix!,
              SizedBox(width: prefixSpace),
            ],
            Text(
              text,
              style: AppTextStyle.regular.copyWith(
                fontSize: 17,
                color: onPressed != null
                    ? colorScheme.textColor
                    : colorScheme.textColorDisabled,
              ),
            ),
            if (suffix != null) ...[
              SizedBox(width: suffixSpace),
              suffix!,
            ],
          ],
        ),
      );
}
