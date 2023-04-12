// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TransferRequestCWProxy {
  TransferRequest destLocationCode(String? destLocationCode);

  TransferRequest processAll(bool? processAll);

  TransferRequest productBarcodeId(int? productBarcodeId);

  TransferRequest quantity(int? quantity);

  TransferRequest sourceLocationCode(String? sourceLocationCode);

  TransferRequest storageCode(String? storageCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransferRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransferRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TransferRequest call({
    String? destLocationCode,
    bool? processAll,
    int? productBarcodeId,
    int? quantity,
    String? sourceLocationCode,
    String? storageCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTransferRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTransferRequest.copyWith.fieldName(...)`
class _$TransferRequestCWProxyImpl implements _$TransferRequestCWProxy {
  final TransferRequest _value;

  const _$TransferRequestCWProxyImpl(this._value);

  @override
  TransferRequest destLocationCode(String? destLocationCode) =>
      this(destLocationCode: destLocationCode);

  @override
  TransferRequest processAll(bool? processAll) => this(processAll: processAll);

  @override
  TransferRequest productBarcodeId(int? productBarcodeId) =>
      this(productBarcodeId: productBarcodeId);

  @override
  TransferRequest quantity(int? quantity) => this(quantity: quantity);

  @override
  TransferRequest sourceLocationCode(String? sourceLocationCode) =>
      this(sourceLocationCode: sourceLocationCode);

  @override
  TransferRequest storageCode(String? storageCode) =>
      this(storageCode: storageCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransferRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransferRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TransferRequest call({
    Object? destLocationCode = const $CopyWithPlaceholder(),
    Object? processAll = const $CopyWithPlaceholder(),
    Object? productBarcodeId = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
    Object? sourceLocationCode = const $CopyWithPlaceholder(),
    Object? storageCode = const $CopyWithPlaceholder(),
  }) {
    return TransferRequest(
      destLocationCode: destLocationCode == const $CopyWithPlaceholder()
          ? _value.destLocationCode
          // ignore: cast_nullable_to_non_nullable
          : destLocationCode as String?,
      processAll: processAll == const $CopyWithPlaceholder()
          ? _value.processAll
          // ignore: cast_nullable_to_non_nullable
          : processAll as bool?,
      productBarcodeId: productBarcodeId == const $CopyWithPlaceholder()
          ? _value.productBarcodeId
          // ignore: cast_nullable_to_non_nullable
          : productBarcodeId as int?,
      quantity: quantity == const $CopyWithPlaceholder()
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as int?,
      sourceLocationCode: sourceLocationCode == const $CopyWithPlaceholder()
          ? _value.sourceLocationCode
          // ignore: cast_nullable_to_non_nullable
          : sourceLocationCode as String?,
      storageCode: storageCode == const $CopyWithPlaceholder()
          ? _value.storageCode
          // ignore: cast_nullable_to_non_nullable
          : storageCode as String?,
    );
  }
}

extension $TransferRequestCopyWith on TransferRequest {
  /// Returns a callable class that can be used as follows: `instanceOfTransferRequest.copyWith(...)` or like so:`instanceOfTransferRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TransferRequestCWProxy get copyWith => _$TransferRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferRequest _$TransferRequestFromJson(Map<String, dynamic> json) =>
    TransferRequest(
      processAll: json['processAll'] as bool?,
      destLocationCode: json['destLocationCode'] as String?,
      sourceLocationCode: json['sourceLocationCode'] as String?,
      productBarcodeId: json['productBarcodeId'] as int?,
      storageCode: json['storageCode'] as String?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$TransferRequestToJson(TransferRequest instance) =>
    <String, dynamic>{
      'processAll': instance.processAll,
      'destLocationCode': instance.destLocationCode,
      'sourceLocationCode': instance.sourceLocationCode,
      'productBarcodeId': instance.productBarcodeId,
      'storageCode': instance.storageCode,
      'quantity': instance.quantity,
    };
