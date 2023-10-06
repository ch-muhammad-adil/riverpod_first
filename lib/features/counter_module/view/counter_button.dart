import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CounterButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed, child: const Text('Get Counter'));
  }
}
