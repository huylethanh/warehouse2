import 'package:flutter/cupertino.dart';
import 'package:warehouse_app/view_models/logics/index.dart';
import 'package:warehouse_app/view_models/view_model_base.dart';

class PutAwayViewModel extends ViewModelBase {
  final RegisterTransport registerTransport = RegisterTransport();

  String scannedBarcode = "";
  scan(BuildContext context, String scannedBarcode) {}
}
