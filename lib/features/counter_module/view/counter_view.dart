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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => ref.read(counterProvider.notifier).getCounterFromAPI());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final counterState = ref.watch(counterProvider);
    return SizedBox(
        height: 200,
        width: 200,
        child: Builder(
          builder: (context) {
            return counterState.when(
                data: (data) => Center(
                    child: Text(data.counter.value.toString(),
                        style: const TextStyle(fontSize: 30))),
                error: (_, error) => const Center(child: Text('Error')),
                loading: () => const Center(child: Text('Loading')));
          },
        ));
  }
}
