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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTextStyle(
            style: const TextStyle(fontWeight: FontWeight.bold),
            child: fieldName),
        if (expanedFieldName)
          const Expanded(
            child: SizedBox(),
          ),
        if (!expanedFieldName)
          const SizedBox(
            width: 8,
          ),
        Flexible(
          child: DefaultTextStyle(
              style: const TextStyle(fontWeight: FontWeight.bold),
              child: value),
        ),
      ],
    );
  }
}
