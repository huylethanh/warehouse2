import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/models/index.dart';
import 'package:warehouse_app/utils/index.dart';
import 'package:warehouse_app/widgets/index.dart';

import 'receive_session_screen_view_model.dart';

class ReceiveSessionScreen extends StatelessWidget {
  final ReceiveModel receiveModel;
  final ConditionType conditionType;
  final ReceiveTask? receiveTask;

  const ReceiveSessionScreen({
    super.key,
    required this.conditionType,
    required this.receiveModel,
    this.receiveTask,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return ReceiveSessionScreenViewModel(
          session: receiveModel,
          conditionType: conditionType,
          receiveTask: receiveTask,
        );
      },
      onViewModelReady: (ReceiveSessionScreenViewModel viewModel) {
        viewModel.init();
      },
      builder:
          (BuildContext context, ReceiveSessionScreenViewModel viewModel, _) {
        if (viewModel.isBusy) {
          return const LoadingWidget();
        }
        final model = viewModel.session;
        const vGap = SizedBox(
          height: 10,
        );

        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text("Nhận hàng"),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        RoundedContainer(
                          backgroundColor: AppColor.gray400.withOpacity(0.5),
                          innerPadding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Text(
                                      StringFormat.hm(model.createdDate),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const VerticalDivider(
                                      color: Colors.grey,
                                      width: 20,
                                      thickness: 0.5,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            model.shortName!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          vGap,
                                          Text(
                                            "${model.code} - ${model.irCode}",
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              vGap,
                              const Divider(),
                              vGap,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Tình Trạng Hàng Hóa"),
                                  Expanded(
                                    child: Text(
                                      textAlign: TextAlign.right,
                                      viewModel
                                          .conditionType.conditionTypeName!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              if (viewModel.hasCurrentCode()) ...[
                                vGap,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Mã Thiết Bị Chứa Hàng"),
                                    Expanded(
                                      child: Text(
                                        viewModel.transportControl.currentCode!,
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    vGap,
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                        vGap,
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
                        vGap,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SplashButtonWidget(
                              borderRadius: const Radius.circular(5),
                              innerPadding: const EdgeInsets.all(6),
                              margin: const EdgeInsets.only(right: 8),
                              color: AppColor.secondary500,
                              child: const Icon(FontAwesomeIcons.barcode),
                              onPressed: () {
                                scanBarcodeByCamera(context, viewModel);
                              },
                            ),
                            Expanded(
                              child: TextFormField(
                                key: UniqueKey(),
                                //   controller: viewModel.controller,
                                initialValue: viewModel.scannedBarcode,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: viewModel.hasCurrentCode()
                                      ? 'Scan barcode'
                                      : 'Quét Thiết Bị Chứa Hàng',
                                  labelStyle: const TextStyle(fontSize: 15),
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                ),
                                onChanged: (value) {
                                  viewModel.scannedBarcode = value;
                                },
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  viewModel.scan(
                                      context, viewModel.scannedBarcode);
                                },
                                child: const Icon(FontAwesomeIcons.arrowRight))
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        vGap,
                        ElevatedButton(
                          onPressed: () {
                            viewModel.finish(context);
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50)),
                          child: const Text("End"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            if (viewModel.isProcessing)
              const BlurLoadingWidget(
                text: "Loading...",
              ),
          ],
        );
      },
    );
  }

  Future<void> scanBarcodeByCamera(
      BuildContext context, ReceiveSessionScreenViewModel viewModel) async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      // ignore: use_build_context_synchronously
      viewModel.processInput(context, barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }
}
