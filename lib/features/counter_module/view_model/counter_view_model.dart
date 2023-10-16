import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_first/features/counter_module/repository/counter_repo.dart';
import 'package:riverpod_first/features/counter_module/view_model/state/counter_state.dart';

import '../model/counter.dart';

final counterProvider =
    StateNotifierProvider<CounterViewModel, AsyncValue<CounterState>>((ref) {
  return CounterViewModel();
});

class CounterViewModel extends StateNotifier<AsyncValue<CounterState>> {
  CounterViewModel() : super(AsyncValue.data(CounterState(Counter(value: 0))));

  void increment() => state = AsyncValue.data(CounterState(
      Counter(value: state.value!.counter.value! + 1),
      isIncrementing: true));

  void decrement() => state = AsyncValue.data(CounterState(
      Counter(value: state.value!.counter.value! - 1),
      isIncrementing: false));

  void getCounterFromAPI() async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2));
    state = AsyncValue.error('Error message', StackTrace.current);
    state = AsyncData(CounterState(await CounterRepo().getCounterFromAPI()));
  }
}
