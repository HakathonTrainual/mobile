import 'package:flutter/material.dart';
import 'package:hackathon_trainual_mobile/screens/home/widgets/nav_button.dart';

class NavBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const NavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFCCCCCC).withOpacity(.4),
        borderRadius: const BorderRadius.all(Radius.circular(300)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 16,
                right: 1,
              ),
              child: NavButton(
                onTap: () => onTap(0),
                iconUrl: 'assets/images/game.svg',
                name: 'Game',
                isSelected: currentIndex == 0 ? true : false,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                right: 16,
                left: 1,
              ),
              child: NavButton(
                onTap: () => onTap(1),
                iconUrl: 'assets/images/person.svg',
                name: 'Profile',
                isSelected: currentIndex == 1 ? true : false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
