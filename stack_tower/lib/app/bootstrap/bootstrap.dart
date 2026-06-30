import '../di/injector.dart';
import '../../core/services/ads/ad_service.dart';

Future<void> bootstrap() async {
  await setupDependencies();

  await AdService.initialize();
}