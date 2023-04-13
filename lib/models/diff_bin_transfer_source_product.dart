import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'ir_code_view.dart';

part 'diff_bin_transfer_source_product.g.dart';

@CopyWith()
@JsonSerializable()
class DiffBinTransferSourceProduct {
  final int? partnerId;
  final int? productId;
  final int? productBarcodeId;
  final String? productName;
  final String? avatarUrl;
  final int? qty;
  final String? receivedDate;
  final String? barcode;
  final List<String>? details;
  final List<IrCodeView>? advances;
  final String? partnerName;
  final String? partnerSku;
  final String? storageTypeName;
  final int? conditionTypeId;
  final int? unitId;
  final int? productBrandId;
  final String? productBrandName;

  DiffBinTransferSourceProduct({
    this.advances,
    this.avatarUrl,
    this.barcode,
    this.conditionTypeId,
    this.details,
    this.partnerId,
    this.partnerName,
    this.partnerSku,
    this.productBarcodeId,
    this.productBrandId,
    this.productBrandName,
    this.productId,
    this.productName,
    this.qty,
    this.receivedDate,
    this.storageTypeName,
    this.unitId,
  });

  bool equals(dynamic other) {
    if (other == null || other! is DiffBinTransferSourceProduct) {
      return false;
    }
    return productBarcodeId == other.productBarcodeId;
  }

  @override
  int get hashCode {
    var result = partnerId!.hashCode;
    result = 31 * result + productId.hashCode;
    result = 31 * result + productBarcodeId.hashCode;
    result = 31 * result + productName.hashCode;
    result = 31 * result + (avatarUrl?.hashCode ?? 0);
    result = 31 * result + (qty ?? 0);
    result = 31 * result + receivedDate.hashCode;
    result = 31 * result + barcode.hashCode;
    result = 31 * result + details.hashCode;
    return result;
  }

  bool areItemsTheSame(DiffBinTransferSourceProduct oldItem,
      DiffBinTransferSourceProduct newItem) {
    return oldItem.productBarcodeId == newItem.productBarcodeId;
  }

  bool areContentsTheSame(DiffBinTransferSourceProduct oldItem,
      DiffBinTransferSourceProduct newItem) {
    return false;
  }

  @override
  bool operator ==(Object other) {
    return super == other;
  }

  // companion object {
  //       fun diffCallback() = object : DiffUtil.ItemCallback<DiffBinTransferSourceProduct>() {
  //           override fun areItemsTheSame(
  //               oldItem: DiffBinTransferSourceProduct,
  //               newItem: DiffBinTransferSourceProduct
  //           ): Boolean {
  //               return oldItem.productBarcodeId == newItem.productBarcodeId
  //           }

  //           override fun areContentsTheSame(
  //               oldItem: DiffBinTransferSourceProduct,
  //               newItem: DiffBinTransferSourceProduct
  //           ): Boolean {
  //               return false
  //           }
  //       }
  //   }
}
