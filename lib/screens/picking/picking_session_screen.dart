import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import 'picking_session_screen_view_model.dart';

class PickingSessionScreen extends StatelessWidget {
  final ORPicking orPicking;
  const PickingSessionScreen({
    super.key,
    required this.orPicking,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return PickingSessionScreenViewModel(orPicking);
      },
      builder:
          (BuildContext context, PickingSessionScreenViewModel viewModel, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Nhận Hàng"),
            centerTitle: true,
            actions: [
              TextButton(
                onPressed: () {
                  //
                },
                child: const Text(
                  "Bỏ qua",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              RoundedContainer(
                backgroundColor: AppColor.color3D3D3D,
                child: Column(
                  children: [
                    FieldValue(
                      fieldName: const Icon(
                        FontAwesomeIcons.box,
                        color: Colors.green,
                        size: 15,
                      ),
                      value: Text(
                        orPicking.code!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    FieldValue(
                      fieldName: const Text("Số lượng sản phẩm: "),
                      value: Text(
                        "${orPicking.productCount}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              BarcodeScanner(
                finishScanned: (barcode) {
                  //
                },
                labelText: "CHọn abc",
                onBarcodeValueChanges: (value) {},
              ),
            ]),
          ),
        );
      },
    );
  }
}
