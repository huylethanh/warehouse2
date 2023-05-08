import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/screens/cycle_counts/screen_daily/daily_verify_cycle_count_screen_view_model.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

class DailyVerifyCycleCountScreen extends StatelessWidget {
  final CycleCountTask? resumeTask;

  const DailyVerifyCycleCountScreen({super.key, this.resumeTask});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return DailyVerifyCycleCountScreenViewModel();
      },
      onViewModelReady: (DailyVerifyCycleCountScreenViewModel viewModel) {
        if (this.resumeTask != null) {
          viewModel.resume(resumeTask!.sessionId!);
          return;
        }
        viewModel.loadData();
      },
      builder: (BuildContext context,
          DailyVerifyCycleCountScreenViewModel viewModel, _) {
        if (viewModel.isBusy) {
          return const LoadingWidget();
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Xác nhận kiểm kê thường nhật",
              style: TextStyle(fontSize: 16),
            ),
            centerTitle: true,
            actions: [
              if (viewModel.started == null)
                TextButton(
                    onPressed: () {
                      viewModel.reloadData();
                    },
                    child: const Text("Refresh"))
            ],
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    BarcodeScanner(
                      value: viewModel.scannedBarcode,
                      finishScanned: (code) {
                        viewModel.processInput(context, code);
                      },
                      labelText: viewModel.getScanMessage(),
                      onBarcodeValueChanges: (value) {
                        viewModel.scannedBarcode = value;
                      },
                      cargoSelectedChanges: viewModel.cargoSelectedChanges,
                      cargoSelected: viewModel.gettingCargo,
                    ),
                    Flexible(
                      child: _body(context, viewModel),
                    ),
                  ],
                ),
              ),
              if (viewModel.isProcessing) const BlurLoadingWidget()
            ],
          ),
        );
      },
    );
  }

  Widget _body(
      BuildContext context, DailyVerifyCycleCountScreenViewModel viewModel) {
    if (viewModel.started == null) {
      return _locations(context, viewModel);
    }

    final started = viewModel.started!;
    final waiting = started.waiting;
    final counting = started.counting;
    const vGap = SizedBox(
      height: 8,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedContainer(
            backgroundColor: AppColor.color3D3D3D,
            child: FieldValue(
              expanedFieldName: true,
              fieldName: const Text("Vị trí đang kiểm kê:"),
              value: Text(
                started.location!,
                style: const TextStyle(color: Colors.blue, fontSize: 22),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (counting.isNotEmpty) ...[
                    vGap,
                    const Text("Sản phẩm đang kiểm kê"),
                    vGap,
                    ..._list(context, viewModel, counting, true),
                  ],
                  if (waiting.isNotEmpty) ...[
                    vGap,
                    const Text("Sản phẩm chưa kiểm kê"),
                    vGap,
                    ..._list(context, viewModel, waiting, false),
                  ],
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _list(
      BuildContext context,
      DailyVerifyCycleCountScreenViewModel viewModel,
      List<CycleCountItem> items,
      bool isCounting) {
    const vGap = SizedBox(
      height: 8,
    );

    return items.map((item) {
      final isDeviatedFirst = viewModel.isDeviatedFirst(item);
      final isDeviatedSecond = viewModel.isDeviatedSecond(item);

      return RoundedContainer(
        margin: const EdgeInsets.symmetric(vertical: 4),
        backgroundColor: AppColor.color3D3D3D,
        child: Row(
          children: [
            RoundedContainer(
              backgroundColor: AppColor.color636366,
              height: 70,
              width: 70,
              child: Image.network(
                item.image ?? "",
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
                children: [
                  FieldValue(
                    fieldName: const Text("Tên sản phẩm:"),
                    value: Text(
                      item.name ?? "",
                      softWrap: true,
                      // style: TextStyle(overflow: TextOverflow.ellipsis),
                      //maxLines: 2,
                    ),
                  ),
                  vGap,
                  FieldValue(
                    fieldName: const Text("Mã sản phẩm:"),
                    value: Text(
                      item.barcode ?? "",
                      style: const TextStyle(color: Colors.green, fontSize: 18),
                    ),
                  ),
                  if (isCounting)
                    FieldValue(
                      fieldName: const Text("Số lượng:"),
                      value: Text(
                        "${item.quantity1}",
                        style:
                            const TextStyle(color: Colors.green, fontSize: 18),
                      ),
                    ),
                  vGap,
                  RoundedContainer(
                    innerPadding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _rowData("Lần:", 1, Colors.green),
                        _rowData("Tổng:", item.systemQty1, Colors.blue),
                        _rowData("Đã đếm:", item.quantity1, Colors.orange),
                        _rowData(
                          "Lệch:",
                          viewModel.getQuantityDeviated(
                              item.systemQty1, item.quantity1, isDeviatedFirst),
                          Colors.red,
                        ),
                      ],
                    ),
                  ),
                  if (isCounting) ...[
                    vGap,
                    RoundedContainer(
                      backgroundColor: AppColor.color1E1E1E,
                      innerPadding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _rowData("Lần:", 2, Colors.green),
                          _rowData("Tổng:", item.systemQty2, Colors.blue),
                          _rowData("Đã đếm:", item.quantity2, Colors.orange),
                          _rowData(
                            "Lệch:",
                            viewModel.getQuantityDeviated(item.systemQty2,
                                item.quantity2, isDeviatedSecond),
                            Colors.red,
                          ),
                        ],
                      ),
                    )
                  ],
                ],
              ),
            )
          ],
        ),
      );
    }).toList();
  }

  Widget _locations(
      BuildContext context, DailyVerifyCycleCountScreenViewModel viewModel) {
    final locations = viewModel.partnerDetail?.cycleCountLocations ?? [];

    if (locations.isEmpty) {
      return const EmptyWidget();
    }

    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (BuildContext context, int index) {
        final item = locations[index];

        return RoundedContainer(
            key: Key(item.cycleCountId!.toString()),
            margin: const EdgeInsets.only(bottom: 8),
            backgroundColor: AppColor.color3D3D3D,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _columData("Vị trí", item.locationCode ?? "", Colors.green),
                _columData("SL Tồng", item.totalQty, Colors.blue),
                _columData("SL Đếm", item.totalCountingQty, Colors.orange),
                _columData("SL Lệch", item.totalDifferentQty, Colors.red),
              ],
            ));
      },
    );
  }

  Widget _columData(String label, dynamic data, Color dataTextColor) {
    return Column(children: [
      Text(label),
      const SizedBox(
        height: 8,
      ),
      Text(
        "$data",
        style: TextStyle(color: dataTextColor, fontSize: 18),
      ),
    ]);
  }

  Widget _rowData(String label, dynamic data, Color dataTextColor) {
    return Row(children: [
      Text(label),
      const SizedBox(
        width: 8,
      ),
      Text(
        "$data",
        style: TextStyle(color: dataTextColor, fontSize: 18),
      ),
    ]);
  }
}
