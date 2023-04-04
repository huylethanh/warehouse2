import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import 'picking_session_screen_view_model.dart';

class PickingSessionScreen extends StatelessWidget {
  final ORPicking? orPicking;
  final PickUpTask? resumeTask;

  const PickingSessionScreen({super.key, this.orPicking, this.resumeTask});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return PickingSessionScreenViewModel();
      },
      onViewModelReady: (PickingSessionScreenViewModel viewModel) {
        if (resumeTask != null) {
          viewModel.resume(resumeTask!);
          return;
        }

        viewModel.init(orPicking!);
      },
      builder:
          (BuildContext context, PickingSessionScreenViewModel viewModel, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Nhận Hàng"),
            centerTitle: true,
            actions: [
              if (viewModel.showSkip())
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
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
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
                              viewModel.orPicking.code!,
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
                              "${viewModel.orPicking.productCount}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _pickingQuantity(context, viewModel),
                    BarcodeScanner(
                      finishScanned: (barcode) {
                        if (isNullOrEmpty(barcode)) {
                          return;
                        }

                        viewModel.doAction(context, barcode);
                      },
                      value: viewModel.currentCode,
                      labelText: viewModel.getStepName(),
                      onBarcodeValueChanges: (value) {
                        viewModel.currentCode = value;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Hàng kiện"),
                        CupertinoSwitch(
                          onChanged: (bool value) {
                            viewModel.cargoSelectedChanges(value);
                          },
                          value: viewModel.gettingCargo,
                        ),
                      ],
                    ),
                    _bin(context, viewModel)
                  ],
                ),
              ),
              if (viewModel.isProcessing) const BlurLoadingWidget(),
            ],
          ),
        );
      },
    );
  }

  //TODO: this name is temporary
  Widget _pickingQuantity(
      BuildContext context, PickingSessionScreenViewModel viewModel) {
    if (!viewModel.tasksDone.containsKey(TASK.GET_PATH)) {
      return const SizedBox();
    }

    return RoundedContainer(
      margin: const EdgeInsets.symmetric(vertical: 8),
      backgroundColor: AppColor.color3D3D3D,
      child: FieldValue(
        fieldName: const Text(
          "Số lượng hàng cần lấy",
          style: TextStyle(fontSize: 18),
        ),
        expanedFieldName: true,
        value: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 24),
            children: [
              const TextSpan(
                  text: "0 ",
                  style: TextStyle(
                    color: Colors.deepOrange,
                  )),
              TextSpan(text: "/ ${viewModel.orPicking.productCount ?? 'N/A'}"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bin(BuildContext context, PickingSessionScreenViewModel viewModel) {
    if (!viewModel.tasksDone.containsKey(TASK.GET_PATH)) {
      return const SizedBox();
    }

    return RoundedContainer(
      margin: const EdgeInsets.symmetric(vertical: 8),
      backgroundColor: AppColor.color3D3D3D,
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            "Vị trí lấy hàng kế tiếp",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            viewModel.bin?.code ?? "N/A",
            style: const TextStyle(
              fontSize: 24,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
