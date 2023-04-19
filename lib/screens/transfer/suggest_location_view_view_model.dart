import 'package:warehouse_app/base/view_models/view_model_base.dart';
import 'package:warehouse_app/models/models.dart';

import '../../logics/transfer_logic/transfer_logic.dart';

class SuggestLocationViewViewModel extends ViewModelBase {
  final fetchSuggestLocation = GetSuggestLocation();

  final int productId;
  final int conditionTypeId;
  final int unitId;

  SuggestLocation? suggestLocation;

  SuggestLocationViewViewModel({
    required this.productId,
    required this.conditionTypeId,
    required this.unitId,
  });

  Future<void> getSuggestLocation() async {
    setBusy(true);
    suggestLocation = await fetchSuggestLocation.fetchSuggestLocations(
        productId, unitId, conditionTypeId);

    setBusy(false);
  }
}
