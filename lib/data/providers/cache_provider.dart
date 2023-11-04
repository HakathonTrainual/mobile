import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum _Key {
  accessToken(value: 'TOKEN');

  final String value;

  const _Key({required this.value});
}

class CacheProvider {
  late final FlutterSecureStorage _secureStorage;

  String? _accessToken;
  String? get accessToken => _accessToken;

  bool get isAuthorized => accessToken != null;

  Future<void> init() async {
    _secureStorage = const FlutterSecureStorage();

    _accessToken = await _secureStorage.read(key: _Key.accessToken.value);
  }

  Future<void> setAccessToken(String accessToken) async {
    try {
      await _secureStorage.write(
        key: _Key.accessToken.value,
        value: accessToken,
      );

      _accessToken = accessToken;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> clearAuthData() async {
    await Future.wait([
      _secureStorage.delete(key: _Key.accessToken.value),
    ]);

    _accessToken = null;
  }
}
