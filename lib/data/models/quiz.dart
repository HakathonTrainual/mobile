enum Status {
  selected,
  notSelected,
  correct,
  notCorrect,
  blur,
}

class Quiz {
  final String question;
  final List<ImageQuiz> images;

  Quiz({
    required this.question,
    required this.images,
  });

  Quiz copyWith({
    List<ImageQuiz>? images,
  }) =>
      Quiz(
        question: question,
        images: images ?? this.images,
      );
}

class ImageQuiz {
  final String id;
  final bool answer;
  final Status status;
  final String image;

  ImageQuiz({
    /// When we select image change this value
    /// By default is null
    /// -> if isSelected == true and answer == true then isCorrect = true
    /// -> if isSelected == true and answer == false then isCorrect = false
    required this.status,

    /// Answer is data from API and we always should get 1 image with true and other with false.
    required this.answer,
    required this.image,
    required this.id,
  });

  ImageQuiz copyWith({
    Status? status,
  }) =>
      ImageQuiz(
        status: status ?? this.status,
        answer: answer,
        image: image,
        id: id,
      );
}
