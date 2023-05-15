import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/base/view_models/view_model_base.dart';
import 'package:warehouse_app/screens/cycle_counts/models/enum.dart';
import 'package:warehouse_app/screens/cycle_counts/screen_sku/sku_cycle_count_screen.dart';
import 'package:warehouse_app/screens/cycle_counts/screen_sku/sku_verify_cycle_count_screen.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/buttons/index.dart';

import 'screen_daily/daily_cycle_count_screen.dart';
import 'screen_daily/daily_verify_cycle_count_screen.dart';

class CycleCountSelectionView extends StatelessWidget {
  final bool isCycleCount;

  const CycleCountSelectionView({super.key, this.isCycleCount = false});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: () {
      return _CycleCountSelectionViewViewModel(isCycleCount);
    }, builder:
        (BuildContext context, _CycleCountSelectionViewViewModel viewModel, _) {
      final items = viewModel.types;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final current = items[index];
                final isSelected = viewModel.selectedType == current;

                return SplashButtonWidget(
                    borderRadius: const Radius.circular(5),
                    borderColor: isSelected
                        ? AppColor.colorF5870A
                        : AppColor.color636366,
                    color: AppColor.color636366,
                    borderThickness: 1,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    innerPadding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    childAlign: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            viewModel.getDiplayName(current),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: isSelected
                              ? const Icon(
                                  FontAwesomeIcons.check,
                                  color: AppColor.colorF5870A,
                                  size: 15,
                                )
                              : null,
                        )
                      ],
                    ),
                    onPressed: () {
                      viewModel.onSelectItem(current);
                    });
              },
            ),
            SplashButtonWidget(
                margin: const EdgeInsets.only(top: 8),
                color: Colors.green,
                borderRadius: const Radius.circular(10),
                innerPadding: const EdgeInsets.symmetric(vertical: 12),
                child: const Text("Tiếp tục"),
                onPressed: () {
                  viewModel.gotoScreen(context);
                })
          ],
        ),
      );
    });
  }
}

class _CycleCountSelectionViewViewModel extends ViewModelBase {
  List<CycleCountType> types = [CycleCountType.Daily, CycleCountType.SKU];
  CycleCountType? selectedType;
  late bool isCycleCount;

  _CycleCountSelectionViewViewModel(this.isCycleCount);

  String getDiplayName(CycleCountType type) {
    switch (type) {
      case CycleCountType.Daily:
        return isCycleCount
            ? "Xác nhận kiểm kê thường nhật"
            : "Kiểm kê thường nhật";

      case CycleCountType.SKU:
        return isCycleCount
            ? "Xác nhận kiểm kê theo sản phẩm"
            : "Kiểm kê theo sản phẩm";

      default:
        throw Exception(
            "_CycleCountSelectionViewViewModel: Not support CycleCountType:$type");
    }
  }

  void onSelectItem(CycleCountType type) {
    selectedType = type;
    notifyListeners();
  }

  void gotoScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (builder) {
          return _getScreen();
        },
      ),
    );
  }

  Widget _getScreen() {
    late Widget screen;

    switch (selectedType) {
      case CycleCountType.Daily:
        screen = isCycleCount
            ? DailyVerifyCycleCountScreen()
            : DailyCycleCountScreen();
        break;

      case CycleCountType.SKU:
        screen =
            isCycleCount ? SkuVerifyCycleCountScreen() : SkuCycleCountScreen();
        break;
      default:
    }

    return screen;
  }
}
