import 'package:flutter/material.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/index.dart';

class DropDowWidget<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final Function(T?) onChanged;
  final Widget Function(T?) displayItemBuilder;

  const DropDowWidget({
    super.key,
    this.value,
    required this.onChanged,
    required this.items,
    required this.displayItemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      innerPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      backgroundColor: AppColor.gray.withOpacity(0.5),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
            icon: const Icon(
              Icons.unfold_more,
              size: 24,
            ),
            isExpanded: true,
            value: value,
            items: items
                .map((e) => DropdownMenuItem<T>(
                      value: e,
                      child: displayItemBuilder(e),
                    ))
                .toList(),
            onChanged: onChanged),
      ),
    );
  }
}
