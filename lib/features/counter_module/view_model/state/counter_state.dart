import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/counter.dart';

part 'counter_state.freezed.dart';

@freezed
class CounterState with _$CounterState{
  factory CounterState(Counter counter,
      {@Default(false) bool isIncrementing, @Default(false) bool isLoading}) = _CounterState;
}