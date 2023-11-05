import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/resources/color_styles.dart';
import 'package:hackathon_trainual_mobile/resources/text_styles.dart';
import 'package:hackathon_trainual_mobile/screens/update_user/controller/update_user_controller.dart';

class UpdateUserScreen extends GetView<UpdateUserController> {
  static const routeName = '/update-user';

  const UpdateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'About you 😎',
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 28,
                    color: AppColors.textPrimaryLicorice,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 36),
                Text(
                  'Choose your hobby',
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 22,
                    color: AppColors.textPrimaryLicorice,
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      ...controller.hobbies.map(
                        (hobby) => InkWell(
                          onTap: () => controller.onHobbySelected(hobby.id),
                          child: _CustomChip(
                            name: hobby.name,
                            isSelected: hobby.isSelected,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Write about yourself',
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 22,
                    color: AppColors.textPrimaryLicorice,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller.descriptionController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    hintText: 'Hello! My name is ....',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  minLines: 5,
                  maxLines: 8,
                ),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: controller.onSave,
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomChip extends StatelessWidget {
  final String name;
  final bool isSelected;

  const _CustomChip({
    super.key,
    required this.name,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: AppColors.primary,
        ),
        color: isSelected ? AppColors.primary : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        child: Text(
          name,
          style: AppTextStyle.regular.copyWith(
            fontSize: 17,
            color: isSelected ? AppColors.textPrimaryWhite : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
