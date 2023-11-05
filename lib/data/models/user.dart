class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String description;
  final List<dynamic> hobbies;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.description,
    required this.hobbies,
  });

  bool get hasHobbies => hobbies.isNotEmpty;
  bool get hasDescription => description.isNotEmpty;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'] ?? '',
      description: json['description'] ?? '',
      hobbies: json['hobby_names'] ?? [],
    );
  }

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? description,
    List<dynamic>? hobbies,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      description: description ?? this.description,
      hobbies: hobbies ?? this.hobbies,
    );
  }
}
