import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/base/view_models/view_model_base.dart';
import 'package:warehouse_app/screens/cycle_counts/cycle_count_screen.dart';
import 'package:warehouse_app/screens/cycle_counts/models/enum.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/buttons/index.dart';

class CycleCountSelectionView extends StatelessWidget {
  const CycleCountSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: () {
      return _CycleCountSelectionViewViewModel();
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
  List<CycleCountType> types = CycleCountType.values;
  CycleCountType? selectedType;

  String getDiplayName(CycleCountType type) {
    switch (type) {
      case CycleCountType.Daily:
        return "Xác nhận kiểm kê thường nhật";

      case CycleCountType.SKU:
        return "Kiểm kê theo sản phẩm";
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
          return CycleCountScreen();
        },
      ),
    );
  }
}
