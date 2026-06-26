import 'dart:developer';

import 'package:flutter/widgets.dart';

class MemoryManager with WidgetsBindingObserver {
  MemoryManager._();

  static final instance = MemoryManager._();

  bool _paused = false;

  //----------------------------------------------------------
  // Initialize
  //----------------------------------------------------------

  void initialize() {
    WidgetsBinding.instance.addObserver(this);
  }

  //----------------------------------------------------------
  // Lifecycle
  //----------------------------------------------------------

  @override
  void didChangeAppLifecycleState(
      AppLifecycleState state,
      ) {
    switch (state) {
      case AppLifecycleState.paused:
        _paused = true;
        _releaseMemory();
        break;

      case AppLifecycleState.resumed:
        _paused = false;
        break;

      default:
        break;
    }
  }

  //----------------------------------------------------------
  // Release
  //----------------------------------------------------------

  void _releaseMemory() {
    imageCache.clear();

    imageCache.clearLiveImages();

    log("Memory Released");
  }

  //----------------------------------------------------------
  // Dispose
  //----------------------------------------------------------

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}