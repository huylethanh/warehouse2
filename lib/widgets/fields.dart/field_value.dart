import 'package:flutter/material.dart';

class FieldValue extends StatelessWidget {
  final Widget fieldName;
  final Widget value;

  const FieldValue({super.key, required this.fieldName, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DefaultTextStyle(
            style: const TextStyle(fontWeight: FontWeight.bold),
            child: fieldName),
        const SizedBox(
          width: 8,
        ),
        DefaultTextStyle(
            style: const TextStyle(fontWeight: FontWeight.bold), child: value),
      ],
    );
  }
}
