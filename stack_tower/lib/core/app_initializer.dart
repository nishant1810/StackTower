import 'dart:async';

class AppInitializer {
  const AppInitializer._();

  static Future<void> initialize() async {
    // Initialize services here

    await Future.wait([
      Future.value(),
    ]);
  }
}