import 'package:darq/darq.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/utils/constants.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import '../../logics/logic_models/logic_models.dart';
import 'put_away_screen_view_model.dart';

class PutAwayScreen extends StatelessWidget {
  final PutAwayTask? resumeTask;

  const PutAwayScreen({super.key, this.resumeTask});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return PutAwayScreenViewModel();
      },
      onViewModelReady: (PutAwayScreenViewModel viewModel) {
        if (resumeTask != null) {
          viewModel.resume(resumeTask!);
        }
      },
      builder: (BuildContext context, PutAwayScreenViewModel viewModel, _) {
        const vGap = SizedBox(
          height: 10,
        );
        return WillPopScope(
          onWillPop: () {
            if (viewModel.wasFinished()) {
              return Future.value(true);
            }

            viewModel.endSession(context);
            return Future.value(false);
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Lưu Kho"),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      ..._barcodeScanText(context, viewModel),
                      const Divider(),
                      Expanded(
                        child: Column(
                          children: [
                            _binLocation(context, viewModel),
                            _partner(context, viewModel),
                            _checkList(context, viewModel),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          viewModel.endSession(context);
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50)),
                        child: const Text("Kết thúc"),
                      )
                    ],
                  ),
                ),
                if (viewModel.isProcessing)
                  const BlurLoadingWidget(
                    text: "Loading...",
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _barcodeScanText(
      BuildContext context, PutAwayScreenViewModel viewModel) {
    return [
      BarcodeScanner(
        viewModel: viewModel,
        value: viewModel.scannedBarcode,
        finishScanned: (barcode) {
          viewModel.processInput(context, viewModel.scannedBarcode);
        },
        labelText: viewModel.getStepMessage(),
        onBarcodeValueChanges: (value) {
          viewModel.scannedBarcode = value;
        },
      ),
      const SizedBox(
        height: 8,
      ),
      Row(
        children: const [
          Icon(
            FontAwesomeIcons.circleInfo,
            color: Colors.deepOrangeAccent,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              "Quét mã thiết bị chứa hàng để đưa tất cả sản phẩm lên vị trí lưu kho",
              style: TextStyle(
                fontSize: 11,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Hàng kiện"),
          CupertinoSwitch(
            onChanged: (bool value) {
              viewModel.cargoSelectedChanges(value);
            },
            value: viewModel.cargoSelected,
          ),
        ],
      ),
    ];
  }

  Widget _binLocation(
    BuildContext context,
    PutAwayScreenViewModel viewModel,
  ) {
    if (viewModel.checkCodeResponse == null) {
      return const SizedBox();
    }

    final bin = viewModel.checkCodeResponse!;

    int maxNumberSKU = bin.maxNumberSKU ?? 0;

    int currentNumberSKU = bin.currentNumberSKU ?? 0;
    final numberAvailableSkuOfBin = (maxNumberSKU - currentNumberSKU < 0)
        ? 0
        : (maxNumberSKU - currentNumberSKU);
    final numberMaxSkuOfBin = maxNumberSKU;

    return RoundedContainer(
      backgroundColor: AppColor.color636366,
      innerPadding: const EdgeInsets.all(8),
      child: Column(
        children: [
          FieldValue(
              expanedFieldName: true,
              fieldName: const Text("Vị trí thao tác:"),
              value: Text(bin.locationCode ?? "")),
          const SizedBox(
            height: 8,
          ),
          FieldValue(
            expanedFieldName: true,
            fieldName: const Text("SL barcode có thể đặt/ SL barcode tối đa:"),
            value: RichText(
              text: TextSpan(
                text: "$numberMaxSkuOfBin",
                children: [
                  const TextSpan(text: "/"),
                  TextSpan(
                      text: "$numberAvailableSkuOfBin",
                      style: const TextStyle(color: AppColor.colorF6931D))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _partner(
    BuildContext context,
    PutAwayScreenViewModel viewModel,
  ) {
    NewTransport? newTransport = viewModel.newTransport;
    if (newTransport == null) {
      return const SizedBox();
    }

    return RoundedContainer(
      margin: const EdgeInsets.symmetric(vertical: 8),
      backgroundColor: AppColor.color636366,
      innerPadding: const EdgeInsets.all(8),
      child: Column(
        children: [
          FieldValue(
              fieldName: const Text("Khách hàng:"),
              value: Text(newTransport.partner)),
          const SizedBox(
            height: 8,
          ),
          FieldValue(
              fieldName: const Text("Tổng trọng lượng:"),
              value: Text(newTransport.weight)),
        ],
      ),
    );
  }

  Widget _checkList(
    BuildContext context,
    PutAwayScreenViewModel viewModel,
  ) {
    NewTransport? newTransport = viewModel.newTransport;
    if (newTransport == null) {
      return const SizedBox();
    }

    final items = newTransport.checkList;
    int sum = newTransport.total;

    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              newTransport.transportCode!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Sản phẩm cần lưu kho",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FieldValue(
                    fieldName: const Text(
                      "Tổng:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: Text(
                      "$sum",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.colorF6931D,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: RoundedContainer(
                margin: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: AppColor.color3D3D3D,
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = items[index];
                      return _item(context, viewModel, item, index == 0);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(BuildContext context, PutAwayScreenViewModel viewModel,
      CheckListItem item, bool isFirst) {
    return RoundedContainer(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundedContainer(
            innerPadding: EdgeInsets.all(2),
            backgroundColor: Colors.transparent,
            height: 70,
            width: 70,
            child: Image.network(
              item.imgUrl ?? "",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Divider(),
                Row(
                  children: [
                    Expanded(
                      child: FieldValue(
                        fieldName: const Text(
                          "Tên hàng:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        value: Text(
                          item.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Text(
                      "${item.amount}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                FieldValue(
                  fieldName: const Text(
                    "SKU:",
                  ),
                  value: Text(
                    item.sku,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                FieldValue(
                  fieldName: const Text("Tình trạng:",
                      style:
                          TextStyle(fontSize: 12, color: AppColor.colorB4B4B3)),
                  value: Text(
                    isNullOrEmpty(item.condition) ? "NA" : item.condition,
                    style: const TextStyle(
                        fontSize: 12, color: AppColor.colorB4B4B3),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Future<void> scanBarcodeByCamera(
  //     BuildContext context, PutAwayScreenViewModel viewModel) async {
  //   String barcodeScanRes;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.BARCODE);
  //     // // ignore: use_build_context_synchronously
  //     //   viewModel.processInput(context, barcodeScanRes);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }
  // }
}
