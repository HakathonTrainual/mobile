import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/resources/color_styles.dart';
import 'package:hackathon_trainual_mobile/resources/text_styles.dart';
import 'package:hackathon_trainual_mobile/screens/profile/controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Game',
                style: AppTextStyle.regular.copyWith(
                  fontSize: 17,
                  color: AppColors.textPrimaryLicorice,
                ),
              ),
              const SizedBox(height: 36),
              Text(
                'About user',
                style: AppTextStyle.bold.copyWith(
                  fontSize: 28,
                  color: AppColors.textPrimaryLicorice,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Name',
                      style: AppTextStyle.bold.copyWith(
                        fontSize: 15,
                        color: AppColors.textPrimaryLicorice,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    readOnly: true,
                    controller: controller.firstNameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Last Name',
                      style: AppTextStyle.bold.copyWith(
                        fontSize: 15,
                        color: AppColors.textPrimaryLicorice,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    readOnly: true,
                    controller: controller.lastNameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Your hobbies',
                    style: AppTextStyle.bold.copyWith(
                      fontSize: 22,
                      color: AppColors.textPrimaryLicorice,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.start,
                    children: [
                      if (controller.user?.hasHobbies ?? false)
                        ...controller.user!.hobbies
                            .map(
                              (hobby) => DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    color: AppColors.primary,
                                  ),
                                  color: AppColors.primary,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 9),
                                  child: Text(
                                    hobby,
                                    style: AppTextStyle.regular.copyWith(
                                      fontSize: 17,
                                      color: AppColors.textPrimaryWhite,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList()
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'About yourself',
                    style: AppTextStyle.bold.copyWith(
                      fontSize: 22,
                      color: AppColors.textPrimaryLicorice,
                    ),
                  ),
                  TextField(
                    readOnly: true,
                    controller: controller.descController,
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
                  TextButton(
                    onPressed: controller.onLogOutClicked,
                    child: const Text('Log Out'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
