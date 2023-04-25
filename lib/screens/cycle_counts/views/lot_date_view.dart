import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import 'lot_date_view_view_model.dart';

class LotDateView extends StatelessWidget {
  final CycleCountProduct product;

  const LotDateView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    const vGap = SizedBox(
      height: 16,
    );

    return ViewModelBuilder.reactive(viewModelBuilder: () {
      return LotDateViewModel(product);
    }, builder: (context, viewModel, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedContainer(
            backgroundColor: AppColor.color3D3D3D,
            child: Row(
              children: [
                RoundedContainer(
                  backgroundColor: AppColor.color636366,
                  height: 70,
                  width: 70,
                  child: Image.network(
                    product.avatarURL ?? "",
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        FontAwesomeIcons.image,
                        size: 40,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldValue(
                      fieldName: const Text("Tên sản phẩm:"),
                      value: Text(product.productName ?? ""),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    FieldValue(
                      fieldName: const Text("Mã sản phẩm:"),
                      value: Text(
                        product.barcode ?? "",
                        style:
                            const TextStyle(color: Colors.green, fontSize: 20),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          if (viewModel.needDate) ...[
            vGap,
            DateField(
              title: "Ngày sản xuất",
              initialDate: viewModel.issuDate,
              minDate: viewModel.issuDate,
              maxDate: viewModel.issuDate.add(Duration(days: 10000)),
              onSelectedDate: (date) {
                if (date != null) {
                  viewModel.onIssuDateChanges(date);
                }
              },
            ),
            vGap,
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.colorF9B262)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.colorF5870A)),
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
                      EdgeInsets.symmetric(vertical: 1, horizontal: 8),
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
            DateField(
              title: "Ngày hết hạn",
              initialDate: viewModel.expiredDate,
              minDate: viewModel.expiredDate,
              maxDate: viewModel.expiredDate.add(const Duration(days: 10000)),
              onSelectedDate: (date) {
                if (date != null) {
                  viewModel.onExpiredDateChanges(date);
                }
              },
            )
          ],
          if (viewModel.needLotNumber) ...[
            vGap,
            TextFormField(
              initialValue: viewModel.lotNumber,
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
              onChanged: (text) {
                viewModel.onLotNumberChanges(text);
              },
            )
          ],
          if (viewModel.needDate) ...[
            vGap,
            const Text(
              "(*) Trường hợp sản phẩm không có sẵn ngày sản xuất hoặc hạn sử dụng, vui lòng nhập một trong hai và hạn sử dụng có trên bao bị sản phẩm.",
              style: TextStyle(fontSize: 11, color: AppColor.colorB4B4B3),
            )
          ],
          vGap,
          Center(
            child: RichText(
              text: const TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      FontAwesomeIcons.circleInfo,
                      size: 15,
                      color: Colors.red,
                    ),
                  ),
                  TextSpan(
                      text: "   Vui lòng kiểm tra thông tin trước khi xác nhận",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.redAccent,
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: SplashButtonWidget(
                      borderRadius: const Radius.circular(10),
                      innerPadding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 8),
                      color: Colors.green,
                      child: const Text("Xác nhận"),
                      onPressed: () {}),
                ),
                Expanded(
                  child: SplashButtonWidget(
                    borderRadius: const Radius.circular(10),
                    innerPadding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 8),
                    color: Colors.red,
                    child: const Text("Đóng"),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }
}
