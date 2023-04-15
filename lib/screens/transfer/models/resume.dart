import 'package:warehouse_app/screens/transfer/models/source_bin_registered.dart';

import '../../../models/models.dart';

class Resume extends SourceBinRegistered {
  final String? dstLocation;
  final bool allOut;

  Resume(String srcLocation, int totalProductCount, this.dstLocation,
      this.allOut, List<DiffBinTransferSourceProduct> listSourceProduct)
      : super(srcLocation, totalProductCount, listSourceProduct);
}
