import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/utils/constants.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import 'put_away_screen_view_model.dart';

class PutAwayScreen extends StatelessWidget {
  const PutAwayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return PutAwayScreenViewModel();
      },
      builder: (BuildContext context, PutAwayScreenViewModel viewModel, _) {
        const vGap = SizedBox(
          height: 10,
        );
        return Scaffold(
            appBar: AppBar(
              title: Text("Lưu Khho"),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  ..._barcodeScanText(context, viewModel),
                  vGap,
                  const Divider(),
                  vGap,
                  _info(context, viewModel),
                  vGap,
                  _partner(context, viewModel),
                ],
              ),
            ));
      },
    );
  }

  List<Widget> _barcodeScanText(
      BuildContext context, PutAwayScreenViewModel viewModel) {
    return [
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Quet thiết bị chứa hàng',
                labelStyle: TextStyle(fontSize: 15),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
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
                viewModel.processInput(context, viewModel.scannedBarcode);
              },
              child: const Icon(FontAwesomeIcons.arrowRight))
        ],
      ),
      const SizedBox(
        height: 10,
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
      )
    ];
  }

  Widget _info(BuildContext context, PutAwayScreenViewModel viewModel) {
    const vGap = SizedBox(
      height: 10,
    );
    return RoundedContainer(
      backgroundColor: Colors.grey.withOpacity(0.3),
      innerPadding: EdgeInsets.all(8),
      child: Column(
        children: [
          _titleAndValue(title: "Vị trí thao tác", value: "value"),
          vGap,
          _titleAndValue(title: "Số lượng barcode có thể đặt", value: "value"),
        ],
      ),
    );
  }

  Widget _partner(BuildContext context, PutAwayScreenViewModel viewModel) {
    const vGap = SizedBox(
      height: 10,
    );
    return RoundedContainer(
      backgroundColor: Colors.grey.withOpacity(0.3),
      innerPadding: EdgeInsets.all(8),
      child: Column(
        children: [
          _titleAndValue(title: "Khách hàng", value: "value"),
          vGap,
          _titleAndValue(title: "Tổng trọng lượng", value: "value"),
        ],
      ),
    );
  }

  Widget _titleAndValue(
      {required String title, required String value, TextStyle? textStyle}) {
    return DefaultTextStyle(
      style: textStyle ??
          const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
          ),
          Text(value),
        ],
      ),
    );
  }

  Future<void> scanBarcodeByCamera(
      BuildContext context, PutAwayScreenViewModel viewModel) async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      // // ignore: use_build_context_synchronously
      //   viewModel.processInput(context, barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }
}
