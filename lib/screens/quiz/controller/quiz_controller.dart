import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/data/models/quiz.dart';

class QuizController extends GetxController {
  final Rx<Quiz> _quiz = Rx(Quiz(
    question: 'Question 1',
    images: [
      ImageQuiz(
        image:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIF.7JDqNy%252fNyHJTJ35vZ%252bq%252b9g%26pid%3DApi&f=1&ipt=7a0f0be44e3f65286af9e3da61e160a17aad4e3d19c6ce28ebeb8af0c3afb6ce&ipo=images',
        id: 'user1',
        answer: true,
        status: Status.notSelected,
      ),
      ImageQuiz(
        image:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIF.7JDqNy%252fNyHJTJ35vZ%252bq%252b9g%26pid%3DApi&f=1&ipt=7a0f0be44e3f65286af9e3da61e160a17aad4e3d19c6ce28ebeb8af0c3afb6ce&ipo=images',
        id: 'user2',
        answer: false,
        status: Status.notSelected,
      ),
      ImageQuiz(
        image:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIF.7JDqNy%252fNyHJTJ35vZ%252bq%252b9g%26pid%3DApi&f=1&ipt=7a0f0be44e3f65286af9e3da61e160a17aad4e3d19c6ce28ebeb8af0c3afb6ce&ipo=images',
        id: 'user3',
        answer: false,
        status: Status.notSelected,
      ),
      ImageQuiz(
        image:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIF.7JDqNy%252fNyHJTJ35vZ%252bq%252b9g%26pid%3DApi&f=1&ipt=7a0f0be44e3f65286af9e3da61e160a17aad4e3d19c6ce28ebeb8af0c3afb6ce&ipo=images',
        id: 'user4',
        answer: false,
        status: Status.notSelected,
      ),
    ],
  ));

  Quiz get quiz => _quiz.value;

  bool get showNextButton => quiz.images
      .any((e) => e.status == Status.correct || e.status == Status.notCorrect);

  bool get _canNotClickOnImage => quiz.images
      .any((e) => e.status == Status.correct || e.status == Status.notCorrect);

  void onImageClicked(String id) {
    if (_canNotClickOnImage) return;

    final updatedImages = _quiz.value.images.map(
      (image) {
        return image.id == id
            ? image.copyWith(status: Status.selected)
            : image.copyWith(status: Status.notSelected);
      },
    ).toList();

    _quiz.value = _quiz.value.copyWith(images: updatedImages);
  }

  void onSendClicked() {
    final newList = _quiz.value.images.map((image) {
      if (image.status != Status.selected) {
        return image.copyWith(status: Status.blur);
      }

      if (image.status == Status.selected && image.answer) {
        return image.copyWith(status: Status.correct);
      }

      if (image.status == Status.selected && !image.answer) {
        return image.copyWith(status: Status.notCorrect);
      }

      return image;
    }).toList();

    _quiz.value = _quiz.value.copyWith(images: newList);
  }

  Future<void> onNextClicked() async {}
}
