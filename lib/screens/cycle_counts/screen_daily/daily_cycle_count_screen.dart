import 'package:flutter/material.dart';
import 'package:warehouse_app/widgets/inside_pull_to_refresh_widget.dart';
import 'package:warehouse_app/widgets/widgets.dart';

class DailyCycleCountScreen extends StatelessWidget {
  const DailyCycleCountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kiểm kê thường nhật"),
          centerTitle: true,
        ),
        body: InsidePullToRefreshWidget(
          handlerPull: () {
            //
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: BarcodeScanner(
                finishScanned: (code) {
                  //
                },
                labelText: "Quét mã vị trí",
                onBarcodeValueChanges: (value) {
//
                }),
          ),
        ));
  }
}
