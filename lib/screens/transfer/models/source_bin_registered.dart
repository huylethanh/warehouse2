import 'package:warehouse_app/models/models.dart';

class SourceBinRegistered {
  String srcLocation;
  int totalProductCount;
  List<DiffBinTransferSourceProduct> listSourceProduct;

  SourceBinRegistered(
      this.srcLocation, this.totalProductCount, this.listSourceProduct);
}
