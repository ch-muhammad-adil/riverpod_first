import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_first/counter_text.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final helloWorldProvider = Provider((_) => 'Hello ${Platform.operatingSystem}');

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    return MaterialApp(
      title: 'Flutter Riverpod Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: value),
    );
  }
}

final counterProvider = StateNotifierProvider<Counter, CounterValue>((ref) {
  return Counter();
});

class Counter extends StateNotifier<CounterValue> {
  Counter() : super(CounterValue(0));

  void increment() => state = CounterValue(state.value + 1);

  void decrement() => state = CounterValue(state.value - 1);
}

class CounterValue {
  const CounterValue(this.value);

  final int value;
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final counterState = ref.watch(counterProvider);
          ref.listen(counterProvider, (previous, next) {
            print(previous!.value.toString());
            print(next.value);
          });
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                const CounterText(),
                Text(counterState.value.toString()),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () => ref.refresh(counterProvider),
              tooltip: 'Reset',
              child: const Icon(Icons.cancel)),
          FloatingActionButton(
              onPressed: () => ref.read(counterProvider.notifier).decrement(),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove)),
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
