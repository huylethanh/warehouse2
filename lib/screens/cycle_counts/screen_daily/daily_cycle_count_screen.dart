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

        return WillPopScope(
          onWillPop: () async {
            if (viewModel.lvSessionId != 0) {
              final result = await viewModel.finish(context);
              return result;
            }

            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Kiểm kê thường nhật"),
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
                      Flexible(child: _body(context, viewModel))
                    ],
                  ),
                ),
                if (viewModel.isProcessing) const BlurLoadingWidget()
              ],
            ),
          ),
        );
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
          if (counting.isNotEmpty) ...[
            vGap,
            const Text("Sản phẩm đang kiểm kê"),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: _list(context, viewModel, counting, true)),
            ),
          ],
          if (waiting.isNotEmpty) ...[
            vGap,
            const Text("Sản phẩm chưa kiểm kê"),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: _list(context, viewModel, waiting, false)),
            ),
          ],
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
                    const SizedBox(
                      height: 8,
                    ),
                    FieldValue(
                      fieldName: const Text("Mã sản phẩm:"),
                      value: Text(
                        item.barcode ?? "",
                        style:
                            const TextStyle(color: Colors.green, fontSize: 18),
                      ),
                    ),
                    if (isCounting)
                      FieldValue(
                        fieldName: const Text("Số lượng:"),
                        value: Text(
                          "${item.quantity1}",
                          style: const TextStyle(
                              color: Colors.green, fontSize: 18),
                        ),
                      )
                  ],
                ),
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
