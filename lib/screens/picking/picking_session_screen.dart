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
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Nhận Hàng"),
            centerTitle: true,
            actions: [
              if (viewModel.showSkip())
                TextButton(
                  onPressed: () {
                    viewModel.skip(context);
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
                    const SizedBox(
                      height: 8,
                    ),
                    _pickingQuantity(context, viewModel),
                    const SizedBox(
                      height: 8,
                    ),
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
                      cargoSelectedChanges: viewModel.cargoSelectedChanges,
                      cargoSelected: viewModel.gettingCargo,
                    ),
                    _process(context, viewModel),
                    Expanded(
                      child: _registeredTransport(context, viewModel),
                    ),
                    _recentlyPicking(context, viewModel)
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

  Widget _registeredTransport(
      BuildContext context, PickingSessionScreenViewModel viewModel) {
    if (viewModel.registerPickingTransport.registeredTransport.length <= 1) {
      return const SizedBox();
    }

    final registeredTransport =
        viewModel.registerPickingTransport.registeredTransport;

    return Column(
      children: [
        FieldValue(
          fieldName: RichText(
            text: TextSpan(
                style: const TextStyle(fontWeight: FontWeight.bold),
                children: [
                  const TextSpan(
                      text: "Số lượng thiết bị chứa hàng cần đăng kí:"),
                  TextSpan(
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                      ),
                      text:
                          " ${viewModel.registerPickingTransport.registeredTransport.length} /")
                ]),
          ),
          value: Text(
            "${viewModel.orPicking.numOfTransport}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              fontSize: 24,
            ),
          ),
        ),
        // const SizedBox(
        //   height: 4,
        // ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: registeredTransport.length,
          itemBuilder: (context, index) {
            return RoundedContainer(
              margin: const EdgeInsets.only(top: 8),
              backgroundColor: AppColor.color3D3D3D,
              child: Row(
                children: [
                  Expanded(
                    child: FieldValue(
                        fieldName:
                            Text("${registeredTransport.length - index}. "),
                        value: Text(registeredTransport[index])),
                  ),
                  InkWell(
                    onTap: () {
                      viewModel.removeTransport(registeredTransport[index]);
                    },
                    child: const Icon(FontAwesomeIcons.xmark),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _pickingQuantity(
      BuildContext context, PickingSessionScreenViewModel viewModel) {
    // if (!viewModel.tasksDone.containsKey(TASK.GET_PATH)) {
    //   return const SizedBox();
    // }

    if (viewModel.last == null) {
      return const SizedBox();
    }

    final last = viewModel.last;

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
              TextSpan(
                  text: "${last?.total ?? viewModel.count}",
                  style: const TextStyle(
                    color: Colors.deepOrange,
                  )),
              TextSpan(text: "/ ${viewModel.orPicking.productCount ?? 'N/A'}"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _process(
      BuildContext context, PickingSessionScreenViewModel viewModel) {
    // if (!viewModel.tasksDone.containsKey(TASK.GET_PATH)) {
    //   return const SizedBox();
    // }

    if (viewModel.task == TASK.begin) {
      return const SizedBox();
    }

    if (viewModel.task == TASK.registerBin &&
        viewModel.pickController.processing != null) {
      return _product(context, viewModel);
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

  Widget _product(
      BuildContext context, PickingSessionScreenViewModel viewModel) {
    if (viewModel.pickController.processing == null) {
      return SizedBox();
    }

    final product = viewModel.pickController.processing!.product;
    final pick = viewModel.pickController.processing;
    //   final lastPick = viewModel.last;

    return Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          RoundedContainer(
            backgroundColor: AppColor.color3D3D3D,
            child: FieldValue(
              fieldName: Text("Vị trí lấy hàng hiện tại:"),
              expanedFieldName: true,
              value: Text(
                pick!.bin,
                style: const TextStyle(color: Colors.green, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          RoundedContainer(
            backgroundColor: AppColor.color3D3D3D,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoundedContainer(
                  backgroundColor: AppColor.color636366,
                  height: 70,
                  width: 70,
                  child: Image.network(
                    product.image ?? "",
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
                        product.name ?? "N/A",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        product.barcode ?? "N/A",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                            fontSize: 20),
                      ),
                      const Divider(),
                      FieldValue(
                        fieldName: Text("Số lượng:"),
                        value: Text(
                          "${pick.count}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _recentlyPicking(
      BuildContext context, PickingSessionScreenViewModel viewModel) {
    final last = viewModel.last;

    if (last == null) {
      return SizedBox();
    }

    final product = last.product;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Sản phẩm vừa lấy"),
        const SizedBox(
          height: 8,
        ),
        RoundedContainer(
          backgroundColor: AppColor.color3D3D3D,
          child: Row(
            children: [
              Text(
                '${last.transport?.index ?? "N/A"}',
                style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${last.transport?.code ?? "N/A"} ',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${last.bin}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FieldValue(
                    fieldName: const Text(
                      "Barcode:",
                    ),
                    value: Text(
                      '${product!.sku!} ',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${product.typeLabel!}: ${product.serial ?? "N/A"}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
