import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'edit_cycle_count_screen_view_model.dart';

class EditCycleCountScreen extends StatelessWidget {
  final EditProductCycleCount editProductCycleCount;
  const EditCycleCountScreen({super.key, required this.editProductCycleCount});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: () {
      return EditCycleCountScreenViewModel(editProductCycleCount);
    }, builder:
        (BuildContext context, EditCycleCountScreenViewModel viewModel, _) {
      return const Placeholder();
    });
  }
}
