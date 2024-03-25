import 'dart:ui';

class Debouncer {
  final int delay;

  Debouncer({required this.delay});

  void run(VoidCallback callback) {
    Future<void>.delayed(Duration(milliseconds: delay), callback);
  }
}
