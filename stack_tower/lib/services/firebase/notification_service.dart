import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class NotificationService {
  NotificationService._();

  static final instance =
  NotificationService._();

  final FirebaseMessaging _messaging =
      FirebaseMessaging.instance;

  //==========================================================
  // INITIALIZE
  //==========================================================

  Future<void> initialize() async {
    final settings =
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    debugPrint(
      "Notification Permission: ${settings.authorizationStatus}",
    );

    final token = await _messaging.getToken();

    debugPrint("FCM Token: $token");

    FirebaseMessaging.onMessage.listen(
      _handleForeground,
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      _handleNotificationTap,
    );

    final initialMessage =
    await _messaging.getInitialMessage();

    if (initialMessage != null) {
      _handleNotificationTap(initialMessage);
    }
  }

  //==========================================================
  // FOREGROUND
  //==========================================================

  void _handleForeground(
      RemoteMessage message,
      ) {
    debugPrint(
      "Foreground Notification: ${message.notification?.title}",
    );

    // TODO:
    // Show local notification using
    // flutter_local_notifications
  }

  //==========================================================
  // TAP
  //==========================================================

  void _handleNotificationTap(
      RemoteMessage message,
      ) {
    final type =
    message.data["type"];

    switch (type) {
      case "daily_reward":
      // Open Daily Reward page
        break;

      case "achievement":
      // Open Achievements page
        break;

      case "shop":
      // Open Shop page
        break;

      case "event":
      // Open Event page
        break;

      default:
        break;
    }
  }

  //==========================================================
  // TOKEN
  //==========================================================

  Future<String?> token() async {
    return _messaging.getToken();
  }

  //==========================================================
  // SUBSCRIBE
  //==========================================================

  Future<void> subscribe(
      String topic,
      ) async {
    await _messaging.subscribeToTopic(
      topic,
    );
  }

  //==========================================================
  // UNSUBSCRIBE
  //==========================================================

  Future<void> unsubscribe(
      String topic,
      ) async {
    await _messaging.unsubscribeFromTopic(
      topic,
    );
  }
}