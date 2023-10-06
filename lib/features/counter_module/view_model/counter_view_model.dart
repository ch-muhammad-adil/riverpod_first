import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/counter.dart';

final counterProvider = StateNotifierProvider<CounterViewModel, Counter>((ref) {
  return CounterViewModel();
});

class CounterViewModel extends StateNotifier<Counter> {
  CounterViewModel() : super(Counter(value: 0));

  void increment() => state = Counter(value: state.value! + 1);

  void decrement() => state = Counter(value: state.value! - 1);
}
