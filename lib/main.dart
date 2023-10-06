import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/counter_module/view/counter_view.dart';
import 'features/counter_module/view_model/counter_view_model.dart';
import 'features/home/home.dart';

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

