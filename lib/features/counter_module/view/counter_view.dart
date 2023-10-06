import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_first/main.dart';

import '../view_model/counter_view_model.dart';

class CouncterView extends StatefulHookConsumerWidget {
  const CouncterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CounterTextState();
  }
}

class _CounterTextState extends ConsumerState<CouncterView> {
  @override
  Widget build(BuildContext context) {
    final counterState = ref.watch(counterProvider);
    return Container(
      height: 200,
      width: 200,
      color: counterState.isIncrementing?Colors.red:Colors.blue,
      child: Center(
          child: Text(counterState.counter.value.toString(),
              style: const TextStyle(fontSize: 30))),
    );
  }
}
