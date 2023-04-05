import 'package:darq/darq.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/logics/logics.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

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
                  children: [
                    RoundedContainer(
                      backgroundColor: AppColor.colorB4B4B3.withOpacity(0.5),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Tình Trạng Hàng Hóa"),
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.right,
                                  viewModel.conditionType.conditionTypeName!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          if (viewModel.hasCurrentCode()) ...[
                            vGap,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    BarcodeScanner(
                      value: viewModel.scannedBarcode,
                      labelText: viewModel.hasCurrentCode()
                          ? 'Scan barcode'
                          : 'Quét Thiết Bị Chứa Hàng',
                      finishScanned: (String? barcode) {
                        viewModel.processInput(context, barcode!);
                      },
                      onBarcodeValueChanges: (value) {
                        viewModel.scannedBarcode = value;
                      },
                    ),
                    Expanded(child: _receiveItems(context, viewModel)),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.finish(context);
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50)),
                      child: const Text("Kết thúc"),
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

  Widget _receiveItems(
      BuildContext context, ReceiveSessionScreenViewModel viewModel) {
    final items = viewModel.recentList?.value ?? [];

    if (items.isEmpty) {
      return const SizedBox();
    }

    int sum = items.sum((e) => e.amount);

    final recent = viewModel.recentList?.key;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sản phẩm vừa nhận",
        ),
        if (recent != null) ...[
          _recent(context, viewModel, recent),
        ],
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            const Expanded(
              child: Text(
                "Sản phẩm đã nhận",
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
    );
  }

  Widget _item(BuildContext context, ReceiveSessionScreenViewModel viewModel,
      CheckListItem item, bool isFirst) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedContainer(
          backgroundColor: AppColor.color636366,
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
              if (!isFirst) Divider(),
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
    );
  }

  Widget _recent(BuildContext context, ReceiveSessionScreenViewModel viewModel,
      ReceivedItem item) {
    return RoundedContainer(
      margin: const EdgeInsets.only(top: 12),
      backgroundColor: AppColor.color3D3D3D,
      child: Column(
        children: [
          FieldValue(
            fieldName: const Text(
              "Tên hàng:",
            ),
            value: Text(
              isNullOrEmpty(item.name) ? "NA" : item.name!,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          FieldValue(
            fieldName: const Text(
              "SKU:",
            ),
            value: Text(
              isNullOrEmpty(item.name) ? "NA" : item.name!,
            ),
          ),
        ],
      ),
    );
  }
}
