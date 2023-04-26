import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:warehouse_app/utils/utils.dart';

class DateField extends StatefulWidget {
  final String title;
  final DateTime? initialDate;
  final Function(DateTime?) onSelectedDate;
  final DateTime minDate;
  final DateTime maxDate;

  const DateField({
    super.key,
    required this.title,
    this.initialDate,
    required this.onSelectedDate,
    required this.minDate,
    required this.maxDate,
  });

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  late DateTime? initialDate;
  late TextEditingController _controller;

  @override
  void initState() {
    initialDate = widget.initialDate;
    _controller =
        TextEditingController(text: StringFormat.shortDate(initialDate));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final date = StringFormat.shortDate(initialDate);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller,
          readOnly: true,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.colorF9B262)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.colorF5870A)),
            floatingLabelStyle: const TextStyle(color: Colors.grey),
            labelText: widget.title,
            isDense: true,
            suffixIcon: InkWell(
              child: const Icon(
                FontAwesomeIcons.calendarDay,
                color: AppColor.colorF79A31,
                size: 20,
              ),
              onTap: () async {
                final selected = await showDatePicker(
                  context: context,
                  initialDate: initialDate ?? DateTime.now(),
                  firstDate: widget.minDate,
                  lastDate: widget.maxDate,
                );

                if (selected == null) {
                  return;
                }

                initialDate = selected;
                _controller.text = StringFormat.shortDate(initialDate);

                setState(() {});

                widget.onSelectedDate(initialDate);
              },
            ),
          ),
          maxLines: 1,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
