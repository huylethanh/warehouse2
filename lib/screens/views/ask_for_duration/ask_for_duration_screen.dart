import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/logics/logics.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import 'ask_for_duration_screen_view_model.dart';

class ProductInfo {
  String? avatarURL;
  String? productName;
  String code;

  ProductInfo(
      {required this.productName, required this.avatarURL, required this.code});
}

class AskForDurationScreen extends StatelessWidget {
  final ProductInfo product;
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
        return AskForDurationScreenViewModel(durationValue);
      },
      builder:
          (BuildContext context, AskForDurationScreenViewModel viewModel, _) {
        final duration = viewModel.durationValue;
        return Column(
          children: [
            RoundedContainer(
              backgroundColor: AppColor.color3D3D3D,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    product.avatarURL ?? "",
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        FontAwesomeIcons.image,
                        size: 40,
                      );
                    },
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
                      Text(product.code),
                    ],
                  ),
                ],
              ),
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
              // _labelAndDateSelection(
              //   context,
              //   viewModel,
              //   "Ngày hết hạn",
              //   StringFormat.shortDate(duration.expireDate),
              //   "expireDate",
              //   duration.expireDate,
              // ),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColor.colorF9B262)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColor.colorF5870A)),
                        floatingLabelStyle: TextStyle(color: Colors.grey),
                        labelText: "Hạn sử dụng",
                        isDense: true,
                      ),
                      onChanged: (text) {
                        int value = int.parse(text);
                        viewModel.onProductLifeNumberChanges(value);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: RoundedContainer(
                    elevation: 0,
                    borderColor: AppColor.colorF9B262,
                    borderRadius: 5,
                    innerPadding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        items: viewModel.life.keys.map((e) {
                          final text = viewModel.getLifeDisplay(e);
                          return DropdownMenuItem<String>(
                            value: e,
                            child: Text(
                              text,
                            ),
                          );
                        }).toList(),
                        value: viewModel.productLife,
                        onChanged: (value) {
                          viewModel.onLifeSelected(value!);
                        },
                      ),
                    ),
                  ))
                ],
              ),

              vGap,
              _labelAndDateSelection(
                context,
                viewModel,
                "Ngày hết hạn",
                StringFormat.shortDate(duration.expireDate),
                "expireDate",
                duration.expireDate,
                minDate: duration.issueDate,
                // maxDate: duration.expireDate,
              )
            ],
            if (needLotNumber) ...[
              vGap,
              // TextField(
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Số lô',
              //     isDense: true,
              //     contentPadding: EdgeInsets.symmetric(
              //       vertical: 10,
              //       horizontal: 10,
              //     ),
              //   ),
              //   onChanged: (value) {
              //     viewModel.updateDuration("lotNumber", value);
              //   },

              // ),

              TextFormField(
                initialValue: duration.lotNumber,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.colorF9B262)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.colorF5870A)),
                  floatingLabelStyle: TextStyle(color: Colors.grey),
                  labelText: "Số lô",
                  isDense: true,
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
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
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
        );
      },
    );
  }

  Widget _labelAndDateSelection(
    BuildContext context,
    AskForDurationScreenViewModel viewModel,
    String label,
    String displayValue,
    String fieldName,
    DateTime? selectedDate, {
    DateTime? minDate,
    DateTime? maxDate,
  }) {
    return DateField(
        key: Key("$fieldName-${selectedDate?.toString()}"),
        title: label,
        initialDate: selectedDate,
        minDate: minDate ?? DateTime.now().subtract(const Duration(days: 60)),
        maxDate: maxDate ?? DateTime.now().add(const Duration(days: 10000)),
        onSelectedDate: (selected) {
          if (selected != null) {
            viewModel.updateDuration(fieldName, selected);
          }
        });
    // return DefaultTextStyle(
    //   style: const TextStyle(
    //     color: Colors.grey,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Text(
    //         label,
    //       ),
    //       InkWell(
    //         child: RoundedContainer(
    //             width: 140,
    //             innerPadding:
    //                 const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //             backgroundColor: Colors.grey[200],
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               children: [
    //                 Text(displayValue.isEmpty ? "Chọn ngày" : displayValue),
    //                 const SizedBox(
    //                   width: 10,
    //                 ),
    //                 const Icon(
    //                   FontAwesomeIcons.calendarDays,
    //                   color: Colors.grey,
    //                 )
    //               ],
    //             )),
    //         onTap: () async {
    //           bool canSelectDate = viewModel.validateBeforeInputDate(fieldName);

    //           if (!canSelectDate) {
    //             return;
    //           }

    //           if (selectedDate == null) {
    //             if (minDate != null || maxDate != null) {
    //               selectedDate = minDate ?? maxDate;
    //             } else {
    //               selectedDate = DateTime.now();
    //             }
    //           }

    //           final selected = await showDatePicker(
    //               context: context,
    //               initialDate: selectedDate ?? DateTime.now(),
    //               firstDate: minDate ??                      DateTime.now().subtract(const Duration(days: 60)),
    //               lastDate: maxDate ??                   DateTime.now().add(const Duration(days: 10000)));

    //           if (selected == null) {
    //             return;
    //           }

    //           viewModel.updateDuration(fieldName, selected);
    //         },
    //       )
    //     ],
    //   ),
    // );
  }
}
