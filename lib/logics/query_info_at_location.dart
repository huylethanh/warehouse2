import 'package:warehouse_app/services/metadata_service.dart';

import 'logic_models/inbound_product.dart';

class QueryInfoAtLocation {
  final service = MetadataService();

  List<InboundProduct> stow(String locationCode) {
    final List<InboundProduct> result = [];


  }

  fun raw(locationCode: String): Inventory {
        data = service.queryInfo(locationCode)
        return data!!
    }
}
