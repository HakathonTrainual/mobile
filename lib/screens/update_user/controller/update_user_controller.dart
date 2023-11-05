import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/data/api/api_client.dart';
import 'package:hackathon_trainual_mobile/data/models/hobbie.dart';
import 'package:hackathon_trainual_mobile/data/services/user_service.dart';

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

  @override
  void onInit() {
    // _hobbies.value = _userService.user.hobbies;
    _hobbies.value = [
      Hobby(name: 'Jogging', id: 1),
      Hobby(name: 'Running', id: 2),
      Hobby(name: 'Swimming', id: 3),
      Hobby(name: 'Yoga', id: 4),
      Hobby(name: 'Cooking', id: 5),
      Hobby(name: 'Reading', id: 6),
      Hobby(name: 'Gardening', id: 7),
      Hobby(name: 'Painting', id: 8),
      Hobby(name: 'Dancing', id: 9),
    ];

    getHobbies();
    super.onInit();
  }

  void onHobbySelected(int id) {
    final indexOfHobby = _hobbies.value.indexWhere((hobby) => hobby.id == id);
    final copyOfHobbies = [..._hobbies.value];

    copyOfHobbies[indexOfHobby] = copyOfHobbies[indexOfHobby]
        .copyWith(isSelected: !copyOfHobbies[indexOfHobby].isSelected);

    _hobbies.value = copyOfHobbies;
  }

  Future<void> updateUser() async {}

  Future<void> getHobbies() async {
    final response = await _apiClient.getList('/hobbies');

    print(response);
  }
}
