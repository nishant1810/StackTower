import 'package:firebase_performance/firebase_performance.dart';

class PerformanceService {
  PerformanceService._();

  static final instance =
  PerformanceService._();

  final FirebasePerformance _performance =
      FirebasePerformance.instance;

  final Map<String, Trace> _traces = {};

  //==========================================================
  // START TRACE
  //==========================================================

  Future<void> startTrace(
      String name,
      ) async {
    if (_traces.containsKey(name)) {
      return;
    }

    final trace =
    _performance.newTrace(name);

    _traces[name] = trace;

    await trace.start();
  }

  //==========================================================
  // STOP TRACE
  //==========================================================

  Future<void> stopTrace(
      String name,
      ) async {
    final trace = _traces.remove(name);

    if (trace == null) return;

    await trace.stop();
  }

  //==========================================================
  // TRACE ATTRIBUTE
  //==========================================================

  Future<void> putAttribute(
      String traceName,
      String key,
      String value,
      ) async {
    final trace = _traces[traceName];

    if (trace == null) return;

    await trace.putAttribute(
      key,
      value,
    );
  }

  //==========================================================
  // TRACE METRIC
  //==========================================================

  Future<void> incrementMetric(
      String traceName,
      String metric,
      int value,
      ) async {
    final trace = _traces[traceName];

    if (trace == null) return;

    await trace.incrementMetric(
      metric,
      value,
    );
  }
}