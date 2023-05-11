import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import 'edit_cycle_count_screen_view_model.dart';

class EditCycleCountScreen extends StatelessWidget {
  final EditProductCycleCount editProductCycleCount;
  const EditCycleCountScreen({super.key, required this.editProductCycleCount});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return EditCycleCountScreenViewModel(editProductCycleCount);
      },
      onViewModelReady: (EditCycleCountScreenViewModel viewModel) {
        if (editProductCycleCount.isVerify) {
          viewModel.progressVerify(
              editProductCycleCount.sessionId, editProductCycleCount.product);
        }
      },
      builder:
          (BuildContext context, EditCycleCountScreenViewModel viewModel, _) {
        const vGap = SizedBox(
          height: 8,
        );

        final item = editProductCycleCount.product;

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BarcodeScanner(
                            viewModel: viewModel,
                            value: viewModel.scannedBarcode,
                            finishScanned: (code) {
                              viewModel.processInput(context, code);
                            },
                            labelText: "Quét mã sản phẩm/Barcode",
                            onBarcodeValueChanges: (value) {
                              viewModel.scannedBarcode = value;
                            },
                            cargoSelectedChanges:
                                viewModel.cargoSelectedChanges,
                            cargoSelected: viewModel.gettingCargo,
                          ),
                          vGap,
                          RoundedContainer(
                            backgroundColor: AppColor.color3D3D3D,
                            child: FieldValue(
                              expanedFieldName: true,
                              fieldName: const Text("Vị trí đang kiểm kê:"),
                              value: Text(
                                editProductCycleCount.locationCode,
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 22),
                              ),
                            ),
                          ),
                          RoundedContainer(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            backgroundColor: AppColor.color3D3D3D,
                            child: Row(
                              children: [
                                RoundedContainer(
                                  backgroundColor: AppColor.color636366,
                                  height: 70,
                                  width: 70,
                                  child: Image.network(
                                    item.avatarURL ?? "",
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FieldValue(
                                        fieldName: const Text("Tên sản phẩm:"),
                                        value: Text(
                                          item.productName ?? "",
                                          softWrap: true,
                                          // style: TextStyle(overflow: TextOverflow.ellipsis),
                                          //maxLines: 2,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      FieldValue(
                                        fieldName: const Text("Mã sản phẩm:"),
                                        value: Text(
                                          item.barcode ?? "",
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 18),
                                        ),
                                      ),
                                      FieldValue(
                                        fieldName: const Text("Số lượng:"),
                                        value: Text(
                                          "${viewModel.qty()}",
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 18),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          RoundedContainer(
                            width: double.infinity,
                            backgroundColor: AppColor.color3D3D3D,
                            child: Column(
                              children: [
                                const Text(
                                  "Số lượng đã đếm",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                vGap,
                                Text(
                                  "${viewModel.qty()}",
                                  style: const TextStyle(
                                    color: Colors.orange,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SplashButtonWidget(
                                borderRadius: const Radius.circular(8),
                                innerPadding: const EdgeInsets.all(12),
                                margin: const EdgeInsets.only(right: 8),
                                color: Colors.red,
                                child: const Text("Đếm lại"),
                                onPressed: () {
                                  viewModel.reset(context);
                                })),
                        Expanded(
                          child: SplashButtonWidget(
                              borderRadius: const Radius.circular(8),
                              innerPadding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(left: 8),
                              color: Colors.green,
                              child: const Text("Xác nhận"),
                              onPressed: () {}),
                        )
                      ],
                    )
                  ],
                ),
                if (viewModel.isProcessing) const BlurLoadingWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
