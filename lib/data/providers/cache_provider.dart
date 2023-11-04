import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum _Key {
  accessToken(value: 'TOKEN'),
  refreshToken(value: 'REFRESH_TOKEN');

  final String value;

  const _Key({required this.value});
}

class CacheProvider {
  late final FlutterSecureStorage _secureStorage;

  String? _accessToken;
  String? _refreshToken;

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  bool get isAuthorized => _accessToken != null && _refreshToken != null;

  Future<void> init() async {
    _secureStorage = const FlutterSecureStorage();

    _accessToken = await _secureStorage.read(key: _Key.accessToken.value);
    _refreshToken = await _secureStorage.read(key: _Key.refreshToken.value);
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

  Future<void> setRefreshToken(String refreshToken) async {
    try {
      await _secureStorage.write(
        key: _Key.refreshToken.value,
        value: refreshToken,
      );

      _refreshToken = refreshToken;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
