import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import 'daily_cycle_count_screen_view_model.dart';

class DailyCycleCountScreen extends StatelessWidget {
  final CycleCountTask? resumeTask;

  const DailyCycleCountScreen({super.key, this.resumeTask});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return DailyCycleCountScreenViewModel();
      },
      onViewModelReady: (DailyCycleCountScreenViewModel viewModel) {
        if (resumeTask != null) {
          viewModel.resume(resumeTask!.sessionId!);
          return;
        }
        viewModel.loadData();
      },
      builder:
          (BuildContext context, DailyCycleCountScreenViewModel viewModel, _) {
        if (viewModel.isBusy) {
          return const LoadingWidget();
        }

        return Scaffold(
            appBar: AppBar(
              title: const Text("Kiểm kê thường nhật"),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  BarcodeScanner(
                      value: viewModel.scannedBarcode,
                      finishScanned: (code) {
                        viewModel.scan(context, code);
                      },
                      labelText: viewModel.getScanMessage(),
                      onBarcodeValueChanges: (value) {
                        viewModel.scannedBarcode = value;
                      }),
                  Flexible(child: _body(context, viewModel))
                ],
              ),
            ));
      },
    );
  }

  Widget _body(BuildContext context, DailyCycleCountScreenViewModel viewModel) {
    if (viewModel.started == null) {
      return _locations(context, viewModel);
    }

    final started = viewModel.started!;
    final waiting = started.waiting;
    final counting = started.counting;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          RoundedContainer(
            backgroundColor: AppColor.color3D3D3D,
            child: FieldValue(
              expanedFieldName: true,
              fieldName: const Text("Vị trí đang kiểm kê:"),
              value: Text(
                started.location!,
                style: const TextStyle(color: Colors.blue, fontSize: 26),
              ),
            ),
          ),
          if (waiting.isNotEmpty)
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: _list(context, viewModel, waiting, false)),
            ),
          if (counting.isNotEmpty)
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: _list(context, viewModel, counting, true)),
            ),
        ],
      ),
    );
  }

  Widget _list(BuildContext context, DailyCycleCountScreenViewModel viewModel,
      List<CycleCountItem> items, bool isCounting) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, index) {
        final item = items[index];
        return RoundedContainer(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FieldValue(
                    fieldName: const Text("Tên sản phẩm:"),
                    value: Text(item.name ?? ""),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FieldValue(
                    fieldName: const Text("Mã sản phẩm:"),
                    value: Text(
                      item.barcode ?? "",
                      style: const TextStyle(color: Colors.green, fontSize: 20),
                    ),
                  ),
                  FieldValue(
                    fieldName: const Text("Số lượng:"),
                    value: Text(
                      "${item.quantity1}",
                      style: const TextStyle(color: Colors.green, fontSize: 20),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _locations(
      BuildContext context, DailyCycleCountScreenViewModel viewModel) {
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
              children: [
                const Expanded(child: Text("Vị trí")),
                Text(
                  item.locationCode ?? "",
                  style: const TextStyle(fontSize: 20, color: Colors.orange),
                ),
              ],
            ));
      },
    );
  }
}
