import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/data/api/api_client.dart';
import 'package:hackathon_trainual_mobile/data/models/quiz.dart';

class QuizController extends GetxController {
  final Rx<Quiz?> _quiz = Rx(null);

  Quiz? get quiz => _quiz.value;

  bool get showNextButton =>
      quiz?.images != null &&
      quiz!.images.any(
          (e) => e.status == Status.correct || e.status == Status.notCorrect);

  bool get _canNotClickOnImage =>
      quiz?.images != null &&
      quiz!.images.any(
          (e) => e.status == Status.correct || e.status == Status.notCorrect);

  void onImageClicked(int id) {
    if (_canNotClickOnImage) return;

    final updatedImages = _quiz.value!.images.map(
      (image) {
        return image.id == id
            ? image.copyWith(status: Status.selected)
            : image.copyWith(status: Status.notSelected);
      },
    ).toList();

    _quiz.value = _quiz.value!.copyWith(images: updatedImages);
  }

  void onSendClicked() {
    final newList = _quiz.value!.images.map((image) {
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

    _quiz.value = _quiz.value!.copyWith(images: newList);
  }

  Future<void> onNextClicked() async {
    final newList = _quiz.value!.images.map((image) {
      return image.copyWith(status: Status.notSelected);
    }).toList();

    _quiz.value = _quiz.value!.copyWith(images: newList);
  }

  @override
  Future<void> onReady() async {
    final a = await Get.find<ApiClient>().get('/games/start_game');

    _quiz.value = Quiz.fromJson(a.data!);
    _quiz.value!.images[0].image =
        'https://haidamac-images-pro.s3.amazonaws.com/h7i24exe7e6d72j4zss1n5r6bfl9?response-content-disposition=inline%3B%20filename%3D%22woman8.jpg%22%3B%20filename%2A%3DUTF-8%27%27woman8.jpg&response-content-type=image%2Fjpeg&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAWQF6UA3I7VTAWS3M%2F20231105%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20231105T115331Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=9040b3c6e6826ef9becb509be911547cb93479210046e1b340c2a5e947fc1835';
    _quiz.value!.images[1].image =
        'https://haidamac-images-pro.s3.amazonaws.com/dxku3bfd60oiirwcueafmt6xbdg2?response-content-disposition=inline%3B%20filename%3D%22man9.jpg%22%3B%20filename%2A%3DUTF-8%27%27man9.jpg&response-content-type=image%2Fjpeg&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAWQF6UA3I7VTAWS3M%2F20231105%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20231105T115331Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=636653e1d7f98266d627dd505d8db981084580f0c69dd579e617ca8c5b9eec34';
    _quiz.value!.images[2].image =
        'https://haidamac-images-pro.s3.amazonaws.com/c74i7vpwm368hn2h9sb9ua534518?response-content-disposition=inline%3B%20filename%3D%22man6.jpg%22%3B%20filename%2A%3DUTF-8%27%27man6.jpg&response-content-type=image%2Fjpeg&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAWQF6UA3I7VTAWS3M%2F20231105%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20231105T115331Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=871cff0c41b8d49bc1f7ae2cd88eb3a36299baf9a9f576718928ccf320458cc7';
    _quiz.value!.images[3].image =
        'https://haidamac-images-pro.s3.amazonaws.com/6r3b2ewgx3gim6pl4tqw2xnpfd4h?response-content-disposition=inline%3B%20filename%3D%22woman1.jpg%22%3B%20filename%2A%3DUTF-8%27%27woman1.jpg&response-content-type=image%2Fjpeg&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAWQF6UA3I7VTAWS3M%2F20231105%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20231105T115331Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=32466848b97bf281b9eb533534af6885a4fe5e9c4580c9c6cbf6c500aa74188b';

    super.onReady();
  }
}
