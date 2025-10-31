import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stopwatch_notifier.g.dart';

@Riverpod(keepAlive: false)
class StopwatchNotifier extends _$StopwatchNotifier {
  Timer? _timer;

  @override
  int build() {
    // Cleanup when the provider is disposed
    ref.onDispose(() {
      _timer?.cancel();
    });
    return 0;
  }

  void start() {
    // Cancel any existing timer to prevent multiple timers
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (ref.mounted) {
        state++;
      }
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void reset() {
    _timer?.cancel();
    _timer = null;
    state = 0;
  }
}
