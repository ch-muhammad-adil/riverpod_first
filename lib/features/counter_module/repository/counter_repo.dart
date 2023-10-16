import '../counter.dart';

class CounterRepo {
  Future<Counter> getCounterFromAPI() async {
    await Future.delayed(const Duration(seconds: 4));
    return Counter(value: 100);
  }
}
