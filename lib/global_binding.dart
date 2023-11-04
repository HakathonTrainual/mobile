import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/data/api/api_client.dart';
import 'package:hackathon_trainual_mobile/data/api/auth_interceptor.dart';
import 'package:hackathon_trainual_mobile/data/providers/cache_provider.dart';
import 'package:hackathon_trainual_mobile/data/providers/env_prodiver.dart';
import 'package:hackathon_trainual_mobile/data/services/user_service.dart';

class GlobalBindings {
  Future<void> _asapDependencies() async {
    Get.put(EnvironmentProvider());

    await Get.putAsync(() async {
      final cacheProvider = CacheProvider();
      await cacheProvider.init();
      return cacheProvider;
    });

    Get.put(
      ApiClient(
        envProvider: Get.find(),
        authInterceptor: AuthInterceptor(
          cacheProvider: Get.find(),
        ),
      ),
    );

    /// Fetch / Set token.
    Get.put(
      UserService(
        envProvider: Get.find(),
        cacheProvider: Get.find(),
        apiClient: Get.find(),
      ),
    );
  }

  Future<void> initialize() async {
    await _asapDependencies();
  }
}
