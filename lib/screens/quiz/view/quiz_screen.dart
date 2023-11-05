import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/data/models/quiz.dart';
import 'package:hackathon_trainual_mobile/resources/color_styles.dart';
import 'package:hackathon_trainual_mobile/resources/text_styles.dart';
import 'package:hackathon_trainual_mobile/screens/quiz/controller/quiz_controller.dart';

class QuizScreen extends GetView<QuizController> {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Game',
                  style: AppTextStyle.regular.copyWith(
                    fontSize: 17,
                    color: AppColors.textPrimaryLicorice,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Choose a photo 🫣',
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
                    children: [
                      ...controller.quiz.images
                          .map(
                            (e) => InkWell(
                              onTap: () => controller.onImageClicked(e.id),
                              child: _ImageCard(
                                url: e.image,
                                status: e.status,
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Question:',
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 20,
                    color: AppColors.textPrimaryLicorice,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  controller.quiz.question,
                  style: AppTextStyle.regular.copyWith(
                    fontSize: 17,
                    color: AppColors.textPrimaryLicorice,
                  ),
                ),
                Obx(() {
                  if (controller.showNextButton) {
                    return TextButton(
                      onPressed: controller.onNextClicked,
                      child: const Text('Next'),
                    );
                  } else {
                    return TextButton(
                      onPressed: controller.onSendClicked,
                      child: const Text('Send'),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final String url;
  final Status status;

  const _ImageCard({
    super.key,
    required this.url,
    required this.status,
  });

  Color get blur {
    if (status == Status.correct || status == Status.notCorrect) {
      return Colors.black.withOpacity(.4);
    }

    if (status == Status.blur) {
      return Colors.white.withOpacity(.4);
    }

    return Colors.transparent;
  }

  Color get border {
    if (status == Status.correct) {
      return Colors.green;
    }

    if (status == Status.notCorrect) {
      return Colors.red;
    }

    if (status == Status.selected) {
      return AppColors.primary;
    }

    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            width: MediaQuery.of(context).size.width / 2.3,
            height: MediaQuery.of(context).size.width / 2.3,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2.3,
          height: MediaQuery.of(context).size.width / 2.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: blur,
          ),
        ),
        if (status == Status.correct || status == Status.notCorrect)
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                status == Status.correct
                    ? 'assets/images/check_box.svg'
                    : status == Status.notCorrect
                        ? 'assets/images/cancel_box.svg'
                        : '',
                width: 44,
                height: 44,
              ),
            ),
          ),
        Container(
          width: MediaQuery.of(context).size.width / 2.3,
          height: MediaQuery.of(context).size.width / 2.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.transparent,
            border: Border.all(
              color: border,
              width: 3,
            ),
          ),
        ),
      ],
    );
  }
}
