import 'package:flutter/material.dart';

class FieldValue extends StatelessWidget {
  final Widget fieldName;
  final Widget value;
  final bool expanedFieldName;
  const FieldValue(
      {super.key,
      required this.fieldName,
      required this.value,
      this.expanedFieldName = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: expanedFieldName ? 1 : 0,
          child: DefaultTextStyle(
              style: const TextStyle(fontWeight: FontWeight.bold),
              child: fieldName),
        ),
        const SizedBox(
          width: 8,
        ),
        DefaultTextStyle(
            style: const TextStyle(fontWeight: FontWeight.bold), child: value),
      ],
    );
  }
}
