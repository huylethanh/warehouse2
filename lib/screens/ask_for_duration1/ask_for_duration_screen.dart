import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/models/index.dart';
import 'package:warehouse_app/utils/index.dart';
import 'package:warehouse_app/view_models/index.dart';
import 'package:warehouse_app/view_models/models/index.dart';
import 'package:warehouse_app/widgets/index.dart';

class AskForDurationScreen extends StatelessWidget {
  final ReceiveProduct product;
  final DurationValue? durationValue;
  final bool needLotNumber;
  final bool needDuration;

  const AskForDurationScreen({
    super.key,
    required this.product,
    this.durationValue,
    this.needLotNumber = false,
    this.needDuration = false,
  });

  @override
  Widget build(BuildContext context) {
    const vGap = SizedBox(
      height: 10,
    );

    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return AskForDurationViewModel(durationValue);
      },
      builder: (BuildContext context, AskForDurationViewModel viewModel, _) {
        final duration = viewModel.durationValue;
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    width: 100,
                    image: NetworkImage(
                      product.avatarURL ?? "",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productName ?? "",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(product.sku),
                    ],
                  ),
                ],
              ),
              if (needDuration) ...[
                vGap,
                _labelAndDateSelection(
                  context,
                  viewModel,
                  "Ngày sản xuất",
                  StringFormat.shortDate(duration.issueDate),
                  "issueDate",
                  duration.issueDate,
                  maxDate: duration.expireDate,
                ),
                vGap,
                _labelAndDateSelection(
                  context,
                  viewModel,
                  "Ngày hết hạn",
                  StringFormat.shortDate(duration.expireDate),
                  "expireDate",
                  duration.expireDate,
                ),
                vGap,
                _labelAndDateSelection(
                  context,
                  viewModel,
                  "Sử dụng trước ngày",
                  StringFormat.shortDate(duration.bestUseD),
                  "bestUseD",
                  duration.bestUseD,
                  minDate: duration.issueDate,
                  maxDate: duration.expireDate,
                )
              ],
              if (needLotNumber) ...[
                vGap,
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Lot number',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                  ),
                  onChanged: (value) {
                    viewModel.updateDuration("lotNumber", value);
                  },
                ),
                if (!viewModel.validateFields["lotNumber"]!) ...[
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: const [
                      Text(
                        "* Chưa nhập lot number.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
              if (viewModel.percentShelfLife != null) ...[
                vGap,
                Text(
                  "Shelf-life: ${viewModel.percentShelfLife!}",
                  style: TextStyle(color: Colors.redAccent, fontSize: 12),
                ),
              ],
              vGap,
              const Text(
                "Vui lòng kiểm tra thông tin trước khi xác nhận",
                style: TextStyle(color: Colors.redAccent, fontSize: 12),
              ),
              vGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    child: Text("Đóng"),
                  ),
                  ElevatedButton(
                    onPressed: viewModel.isValid
                        ? () {
                            Navigator.pop(context, viewModel.durationValue);
                          }
                        : null,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text("Xác nhận"),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _labelAndDateSelection(
    BuildContext context,
    AskForDurationViewModel viewModel,
    String label,
    String displayValue,
    String fieldName,
    DateTime? selectedDate, {
    DateTime? minDate,
    DateTime? maxDate,
  }) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.grey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
          ),
          InkWell(
            child: RoundedContainer(
                width: 140,
                innerPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                backgroundColor: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(displayValue.isEmpty ? "Chọn ngày" : displayValue),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      FontAwesomeIcons.calendarDays,
                      color: Colors.grey,
                    )
                  ],
                )),
            onTap: () async {
              bool canSelectDate = viewModel.validateBeforeInputDate(fieldName);

              if (!canSelectDate) {
                return;
              }

              if (selectedDate == null) {
                if (minDate != null || maxDate != null) {
                  selectedDate = minDate ?? maxDate;
                } else {
                  selectedDate = DateTime.now();
                }
              }

              final selected = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: minDate ??
                      DateTime.now().subtract(const Duration(days: 60)),
                  lastDate: maxDate ??
                      DateTime.now().add(const Duration(days: 10000)));

              if (selected == null) {
                return;
              }

              viewModel.updateDuration(fieldName, selected);
            },
          )
        ],
      ),
    );
  }
}
