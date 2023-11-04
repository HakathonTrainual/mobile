import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as get_x;
import 'package:hackathon_trainual_mobile/data/api/auth_interceptor.dart';
import 'package:hackathon_trainual_mobile/data/providers/env_prodiver.dart';

class ApiClient extends get_x.GetxService {
  ApiClient({
    required EnvironmentProvider envProvider,
    required AuthInterceptor authInterceptor,
  })  : _envProvider = envProvider,
        _authInterceptor = authInterceptor;

  final EnvironmentProvider _envProvider;
  final AuthInterceptor _authInterceptor;

  BaseOptions get _initBaseOptions => BaseOptions(
        baseUrl: _envProvider.baseUrl,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
      );

  late final Dio _client = Dio(_initBaseOptions)
    ..interceptors.add(_authInterceptor);

  Future<Response<Map<String, dynamic>>> get(
    String path, {
    Map<String, dynamic>? params,
  }) =>
      _client.get(path, queryParameters: params);

  Future<Response<List<dynamic>>> getList(
    String path, {
    Map<String, dynamic>? params,
  }) =>
      _client.get(path, queryParameters: params);

  Future<Response<List<dynamic>>> postList(
    String path, {
    dynamic requestBody,
  }) async =>
      _client.post(path, data: requestBody);

  Future<Response<Uint8List>> getBytes(
    String path, {
    Map<String, dynamic>? params,
  }) =>
      _client.get<Uint8List>(
        path,
        queryParameters: params,
        options: Options(responseType: ResponseType.bytes),
      );

  Future<Response<Map<String, dynamic>>> post(
    String path, {
    Map<String, dynamic>? params,
    dynamic requestBody,
  }) async =>
      _client.post(path, queryParameters: params, data: requestBody);

  Future<Response<Map<String, dynamic>>> put(
    String path, {
    dynamic requestBody,
  }) async =>
      _client.put(path, data: requestBody);

  Future<Response<Map<String, dynamic>>> delete(String path) async =>
      _client.delete(path);

  Future<Response<Map<String, dynamic>>> patch(
    String path, {
    dynamic requestBody,
  }) async =>
      _client.patch(path, data: requestBody);
}
