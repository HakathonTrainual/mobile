import 'package:dio/dio.dart';
import 'package:hackathon_trainual_mobile/data/providers/cache_provider.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  final CacheProvider _cacheProvider;

  AuthInterceptor({
    required CacheProvider cacheProvider,
  }) : _cacheProvider = cacheProvider;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    handler.next(
      options
        ..headers.addAll({
          'Content-Type': 'application/json',
          if (_cacheProvider.accessToken != null)
            'Authorization': _cacheProvider.accessToken,
        }),
    );
  }
}
