import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/screens/cycle_counts/screen_daily/daily_verify_cycle_count_screen_view_model.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

class DailyVerifyCycleCountScreen extends StatelessWidget {
  const DailyVerifyCycleCountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return DailyVerifyCycleCountScreenViewModel();
      },
      onViewModelReady: (DailyVerifyCycleCountScreenViewModel viewModel) {
        viewModel.loadData();
      },
      builder: (BuildContext context,
          DailyVerifyCycleCountScreenViewModel viewModel, _) {
        if (viewModel.isBusy) {
          return const LoadingWidget();
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Xác nhận kiểm kê thường nhật"),
            centerTitle: true,
            actions: [
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

    return SizedBox();
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
                listData("Vị trí", item.locationCode ?? "", Colors.green),
                listData("SL Tồng", item.totalQty, Colors.blue),
                listData("SL Đếm", item.totalCountingQty, Colors.orange),
                listData("SL Lệch", item.totalDifferentQty, Colors.red),
              ],
            ));
      },
    );
  }

  Widget listData(String label, dynamic data, Color dataTextColor) {
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
}
