import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon_trainual_mobile/resources/color_styles.dart';
import 'package:hackathon_trainual_mobile/resources/text_styles.dart';

class NavButton extends StatelessWidget {
  final String iconUrl;
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const NavButton({
    super.key,
    required this.iconUrl,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(300)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SvgPicture.asset(
                  iconUrl,
                  width: 24,
                  height: 24,
                  color: isSelected
                      ? AppColors.textPrimaryWhite
                      : AppColors.textSecondaryGray,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                name,
                style: AppTextStyle.regular.copyWith(
                  fontSize: 13,
                  color: isSelected
                      ? AppColors.textPrimaryWhite
                      : AppColors.textSecondaryGray,
                ),
              ),
            ],
          ),
        ),
      );
}
