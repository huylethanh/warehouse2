import 'package:flutter/material.dart';
import 'package:warehouse_app/base/view_models/index.dart';

import '../../view_models/logics/register_transport.dart';

class PutAwayScreenViewModel extends ViewModelBase {
  final RegisterTransport registerTransport = RegisterTransport();

  String scannedBarcode = "";
  scan(BuildContext context, String scannedBarcode) {}
}
