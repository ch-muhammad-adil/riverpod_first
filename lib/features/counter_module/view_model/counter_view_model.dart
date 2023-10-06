import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/counter.dart';

final counterProvider =
    StateNotifierProvider<CounterViewModel, CounterState>((ref) {
  return CounterViewModel();
});

class CounterState {
  final Counter counter;
  final bool isIncrementing;

  CounterState(this.counter, {this.isIncrementing = false});
}

class CounterViewModel extends StateNotifier<CounterState> {
  CounterViewModel() : super(CounterState(Counter(value: 0)));

  void increment() =>
      state = CounterState(Counter(value: state.counter.value! + 1),
          isIncrementing: true);

  void decrement() =>
      state = CounterState(Counter(value: state.counter.value! - 1),
          isIncrementing: false);
}
