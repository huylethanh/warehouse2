import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/screens/transfer/transfer_screen_view_model.dart';

import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return TransferScreenViewModel();
      },
      builder: (BuildContext context, TransferScreenViewModel viewModel, _) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Luân Chuyển"),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  BarcodeScanner(
                    finishScanned: (barcode) {
                      if (isNullOrEmpty(barcode)) {
                        return;
                      }

                      viewModel.processInput(context, barcode);
                    },
                    value: viewModel.currentCode,
                    labelText: "Quét vị trí nguồn",
                    onBarcodeValueChanges: (value) {
                      viewModel.currentCode = value;
                    },
                    cargoSelectedChanges: viewModel.cargoSelectedChanges,
                    cargoSelected: viewModel.gettingCargo,
                  ),
                ],
              ),
            ));
      },
    );
  }

  Widget sourceBinRegistered(
      BuildContext context, TransferScreenViewModel viewModel) {
    if (viewModel.sourceBinRegistered == null) {
      return SizedBox();
    }

    final list = viewModel.sourceBinRegistered!.listSourceProduct;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return RoundedContainer(
          margin: const EdgeInsets.only(top: 8),
          backgroundColor: AppColor.color3D3D3D,
          child: Row(
            children: [
              const Text("data"),
            ],
          ),
        );
      },
    );
  }
}
