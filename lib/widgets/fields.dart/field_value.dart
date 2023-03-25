import 'package:flutter/material.dart';

class FieldValue extends StatelessWidget {
  final Widget field;
  final Widget value;

  const FieldValue({super.key, required this.field, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        field,
        const SizedBox(
          width: 8,
        ),
        value,
      ],
    );
  }
}
