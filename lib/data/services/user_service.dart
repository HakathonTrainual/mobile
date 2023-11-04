import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_trainual_mobile/data/api/api_client.dart';
import 'package:hackathon_trainual_mobile/data/models/login.dart';
import 'package:hackathon_trainual_mobile/data/models/user.dart';
import 'package:hackathon_trainual_mobile/data/providers/cache_provider.dart';
import 'package:hackathon_trainual_mobile/data/providers/env_prodiver.dart';

class UserService {
  final EnvironmentProvider _envProvider;
  final ApiClient _apiClient;
  final CacheProvider _cacheProvider;

  UserService({
    required EnvironmentProvider envProvider,
    required ApiClient apiClient,
    required CacheProvider cacheProvider,
  })  : _envProvider = envProvider,
        _apiClient = apiClient,
        _cacheProvider = cacheProvider;

  BaseOptions get _initBaseOptions => BaseOptions(
        baseUrl: _envProvider.baseUrl,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
      );

  late final Dio _authClient = Dio(_initBaseOptions);

  late final User user;

  Future<void> signIn(String email, String password) async {
    try {
      final result = await _authClient.post(
        '/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      final loginResponse = LoginResponse.fromJson(result.data);
      await _cacheProvider.setAccessToken(loginResponse.token);
      user = loginResponse.user;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchUser() async {
    final result = await _apiClient.get('/my_profile');

    user = User.fromJson(result.data!);
  }
}
