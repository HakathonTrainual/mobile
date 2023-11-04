import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/data/providers/cache_provider.dart';

class GlobalBindings {
  Future<void> _asapDependencies() async {
    await Get.putAsync(() async {
      final cacheProvider = CacheProvider();
      await cacheProvider.init();
      return cacheProvider;
    });
  }

  Future<void> initialize() async {
    await _asapDependencies();
  }
}
