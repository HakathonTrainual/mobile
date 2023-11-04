import 'package:flutter/material.dart';
import 'package:hackathon_trainual_mobile/resources/color_styles.dart';

class NavButton extends StatelessWidget {
  final IconData icon;
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const NavButton({
    super.key,
    required this.icon,
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
                child: Icon(
                  icon,
                  color: isSelected
                      ? AppColors.textPrimaryWhite
                      : AppColors.textSecondaryGray,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                name,
                style: TextStyle(
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
