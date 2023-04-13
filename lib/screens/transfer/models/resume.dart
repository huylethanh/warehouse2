import '../../../models/models.dart';

class Resume {
  final String srcLocation;
  final int totalProductCount;
  final String? dstLocation;
  final bool allOut;
  final List<DiffBinTransferSourceProduct> listSourceProduct;

  Resume({
    required this.srcLocation,
    required this.totalProductCount,
    this.dstLocation,
    required this.allOut,
    required this.listSourceProduct,
  });
}
