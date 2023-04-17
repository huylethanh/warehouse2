import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/screens/transfer/transfer_screen_view_model.dart';

import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class TransferScreen extends StatelessWidget {
  final TransferTask? resumeTask;
  const TransferScreen({super.key, this.resumeTask});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return TransferScreenViewModel();
      },
      onViewModelReady: (TransferScreenViewModel viewModel) {
        if (resumeTask == null) {
          return;
        }

        viewModel.resume(resumeTask!);
      },
      builder: (BuildContext context, TransferScreenViewModel viewModel, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Luân Chuyển"),
            centerTitle: true,
            leading: BackButton(
              onPressed: () {
                viewModel.finish(context);
              },
            ),
          ),
          body: Stack(
            children: [
              Padding(
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
                      labelText: viewModel.getScanTitle(),
                      onBarcodeValueChanges: (value) {
                        viewModel.currentCode = value;
                      },
                      cargoSelectedChanges: viewModel.cargoSelectedChanges,
                      cargoSelected: viewModel.gettingCargo,
                    ),
                    Expanded(child: _sourceBinRegistered(context, viewModel)),
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

  Widget _sourceBinRegistered(
      BuildContext context, TransferScreenViewModel viewModel) {
    if (viewModel.sourceBinRegistered == null && viewModel.resumeData == null) {
      return const SizedBox();
    }

    final data = viewModel.sourceBinRegistered ?? viewModel.resumeData;

    final List<DiffBinTransferSourceProduct> list = data!.listSourceProduct;

    const itemHgap = SizedBox(
      height: 8,
    );

    const mainGap = SizedBox(
      height: 16,
    );

    int index = -1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mainGap,
        RoundedContainer(
          backgroundColor: AppColor.color3D3D3D,
          child: FieldValue(
            expanedFieldName: true,
            fieldName: const Text("Vị trí nguồn hiện tại"),
            value: Text(
              data.srcLocation,
              style: const TextStyle(color: Colors.blue),
            ),
          ),
        ),
        mainGap,
        FieldValue(
          expanedFieldName: true,
          fieldName: const Text(
            "Sản phẩm tại vị trí nguồn",
          ),
          value: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              children: [
                const TextSpan(text: "Số lượng còn lại: "),
                TextSpan(
                  text: "${data.totalProductCount}/${data.totalProductCount}",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
        mainGap,
        Expanded(
          child: RoundedContainer(
            backgroundColor: AppColor.color3D3D3D,
            child: SingleChildScrollView(
              child: Column(
                //  mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  ...list.map<Widget>((product) {
                    index++;
                    final irCode = viewModel.getIrCode(product);

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          if (index != 0) const Divider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RoundedContainer(
                                backgroundColor: AppColor.color636366,
                                height: 70,
                                width: 70,
                                child: Image.network(
                                  product.avatarUrl ?? "",
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
                                    Text(
                                      product.productName ?? "",
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                    itemHgap,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: FieldValue(
                                        expanedFieldName: true,
                                        fieldName: Text(product.barcode ?? ''),
                                        value: SplashButtonWidget(
                                          innerPadding: const EdgeInsets.all(6),
                                          borderRadius:
                                              const Radius.circular(5),
                                          onPressed: () {
                                            //
                                          },
                                          child: const Text(
                                            "Khu vực gợi ý",
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    itemHgap,
                                    Text(
                                      product.partnerName ?? "",
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                    if (!isNullOrEmpty(
                                        product.productBrandName))
                                      Text(
                                        product.productBrandName ?? "",
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    itemHgap,
                                    Text(
                                      "Ngày nhận hàng: ${product.displayReceivedDate}",
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                    itemHgap,
                                    if (!isNullOrEmpty(product.storageTypeName))
                                      Text(
                                        product.storageTypeName!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.colorB4B4B3,
                                        ),
                                      ),
                                    if (!isNullOrEmpty(irCode))
                                      Text(
                                        irCode,
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                "${product.qty}",
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: list.length,
                  //   itemBuilder: (context, index) {
                  //     final product = list[index];

                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
