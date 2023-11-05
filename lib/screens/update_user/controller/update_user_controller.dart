import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/data/api/api_client.dart';
import 'package:hackathon_trainual_mobile/data/models/hobbie.dart';
import 'package:hackathon_trainual_mobile/data/services/user_service.dart';
import 'package:hackathon_trainual_mobile/screens/home/view/home_screen.dart';

class UpdateUserController extends GetxController {
  final ApiClient _apiClient;
  final UserService _userService;

  UpdateUserController({
    required UserService userService,
    required ApiClient apiClient,
  })  : _userService = userService,
        _apiClient = apiClient;

  final Rx<List<Hobby>> _hobbies = Rx([]);
  List<Hobby> get hobbies => _hobbies.value;

  final TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() {
    getHobbies();
    super.onInit();
  }

  void onHobbySelected(int id) {
    final indexOfHobby = _hobbies.value.indexWhere((hobby) => hobby.id == id);
    final copyOfHobbies = [..._hobbies.value];

    copyOfHobbies[indexOfHobby] = copyOfHobbies[indexOfHobby]
        .copyWith(isSelected: !copyOfHobbies[indexOfHobby].isSelected);

    _hobbies.value = copyOfHobbies;

    if (copyOfHobbies[indexOfHobby].isSelected) {
      _apiClient.post('/user_hobbies?hobby_id=$id');
    } else {}
  }

  void onSave() {
    updateDescription();
    Get.offAndToNamed(HomeScreen.routeName);
  }

  Future<void> updateDescription() async {
    if (descriptionController.text.isEmpty) return;

    final a = await _apiClient.put(
      '/users',
      requestBody: {
        'description': descriptionController.text,
      },
    );
  }

  Future<void> getHobbies() async {
    final response = await _apiClient.getList('/hobbies');

    _hobbies.value =
        (response.data as List).map((e) => Hobby.fromJson(e)).toList();
  }
}
