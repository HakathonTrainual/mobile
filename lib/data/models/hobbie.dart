class Hobby {
  final int id;
  final String name;
  final bool isSelected;

  Hobby({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  factory Hobby.fromJson(Map<String, dynamic> map) {
    return Hobby(
      id: map['id'],
      name: map['name'],
    );
  }

  Hobby copyWith({
    String? name,
    bool? isSelected,
  }) =>
      Hobby(
        id: id,
        name: name ?? this.name,
        isSelected: isSelected ?? this.isSelected,
      );
}
