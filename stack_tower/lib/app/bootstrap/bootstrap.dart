import '../di/injector.dart';

Future<void> bootstrap() async {
  await setupDependencies();
}