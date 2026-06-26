import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class CrashlyticsService {
  CrashlyticsService._();

  static final instance = CrashlyticsService._();

  final FirebaseCrashlytics _crashlytics =
      FirebaseCrashlytics.instance;

  //==========================================================
  // INITIALIZE
  //==========================================================

  Future<void> initialize() async {
    // Disable in debug mode
    await _crashlytics.setCrashlyticsCollectionEnabled(
      !kDebugMode,
    );

    //--------------------------------------------------------
    // Flutter Errors
    //--------------------------------------------------------

    FlutterError.onError = (details) {
      _crashlytics.recordFlutterFatalError(
        details,
      );
    };

    //--------------------------------------------------------
    // Async Errors
    //--------------------------------------------------------

    PlatformDispatcher.instance.onError =
        (error, stack) {
      _crashlytics.recordError(
        error,
        stack,
        fatal: true,
      );

      return true;
    };
  }

  //==========================================================
  // LOG
  //==========================================================

  Future<void> log(
      String message,
      ) async {
    await _crashlytics.log(message);
  }

  //==========================================================
  // NON-FATAL
  //==========================================================

  Future<void> record(
      Object error,
      StackTrace stack,
      ) async {
    await _crashlytics.recordError(
      error,
      stack,
      fatal: false,
    );
  }

  //==========================================================
  // USER ID
  //==========================================================

  Future<void> setUserId(
      String id,
      ) async {
    await _crashlytics.setUserIdentifier(id);
  }

  //==========================================================
  // CUSTOM KEYS
  //==========================================================

  Future<void> setCustomKey(
      String key,
      Object value,
      ) async {
    await _crashlytics.setCustomKey(
      key,
      value,
    );
  }
}