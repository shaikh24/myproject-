import 'package:flutter/material.dart';

class QtyStepper extends StatelessWidget {
  final int qty;
  final VoidCallback onMinus;
  final VoidCallback onPlus;
  const QtyStepper({super.key, required this.qty, required this.onMinus, required this.onPlus});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(onPressed: onMinus, icon: const Icon(Icons.remove)),
        Text('$qty'),
        IconButton(onPressed: onPlus, icon: const Icon(Icons.add)),
      ],
    );
  }
}
