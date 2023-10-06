import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_first/main.dart';

import '../view_model/counter_view_model.dart';

class CouncterVie extends StatefulHookConsumerWidget {
  const CouncterVie({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CounterTextState();
  }
}

class _CounterTextState extends ConsumerState<CouncterVie> {
  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counterProvider);
    return Container(
      height: 200,
      width: 200,
      color: Colors.red,
      child:
          Text(counter.value.toString(), style: const TextStyle(fontSize: 30)),
    );
  }
}