import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../counter.dart';

class CounterRepo {
  Stream<Either<String, Counter>> getCounterFromAPI() {
    // Create a StreamController
    final controller = StreamController<Either<String, Counter>>();

    Future.delayed(const Duration(seconds: 4), () {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        /// Create an instance of [Right]
        controller.add(Either<String, Counter>.of(Counter(value: timer.tick)));
        // Optional: Stop the timer after a certain condition
        if (timer.tick == 5) {
          timer.cancel();
          controller.add(Either<String, Counter>.left('Error'));
          controller.close();
        }
      });
    });

    return controller.stream;
  }
}
