import 'package:flutter_broadcasts/flutter_broadcasts.dart';

import '../../base/view_models/view_model_base.dart';
import '../responsive_service.dart';

class BarcodeScannerViewModel extends ViewModelBase {
  BroadcastReceiver receiver = BroadcastReceiver(
    names: [
      "com.scanner.broadcast",
    ],
  );

  BarcodeScannerViewModel() {
    receiver.start();
    // receiver.messages.listen((event) {
    //   final data = event.data?["data"];
    //   if (data == null) {
    //     DialogService.showErrorBotToast("Không đọc được barcode");
    //     return;
    //   }

    //   print(data);
    // });
  }

  void testSendBroadcast() {
    sendBroadcast(BroadcastMessage(name: "com.scanner.broadcast", data: {
      "id": "le thanh huy",
      'data': {'data': "Msters999"}
    }));
  }

  @override
  void dispose() {
    receiver.stop();
    super.dispose();
  }
}
