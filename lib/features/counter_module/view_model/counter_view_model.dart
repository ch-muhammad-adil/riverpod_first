import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_first/features/counter_module/repository/counter_repo.dart';
import 'package:riverpod_first/features/counter_module/view_model/state/counter_state.dart';

import '../model/counter.dart';

final counterProvider =
    StateNotifierProvider<CounterViewModel, CounterState>((ref) {
  return CounterViewModel();
});



class CounterViewModel extends StateNotifier<CounterState> {
  CounterViewModel() : super(CounterState(Counter(value: 0)));

  void increment() =>
      state = CounterState(Counter(value: state.counter.value! + 1),
          isIncrementing: true);

  void decrement() =>
      state = CounterState(Counter(value: state.counter.value! - 1),
          isIncrementing: false);

  void getCounterFromAPI() async {
    state = CounterState(Counter(value: 5), isLoading: true);
    state = CounterState(await CounterRepo().getCounterFromAPI());
  }
}
