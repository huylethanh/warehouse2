import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/logics/logic_models/or_view_item.dart';
import 'package:warehouse_app/screens/picking/picking_list_screen_view_model.dart';
import 'package:warehouse_app/widgets/inside_pull_to_refresh_widget.dart';
import 'package:warehouse_app/widgets/search_appbar.dart';
import 'package:warehouse_app/widgets/widgets.dart';

class PickingListScreen extends StatelessWidget {
  const PickingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return PickingListScreenViewModel();
      },
      onViewModelReady: (PickingListScreenViewModel viewModel) {
        viewModel.init();
      },
      builder: (BuildContext context, PickingListScreenViewModel viewModel, _) {
        if (viewModel.isBusy) {
          return const LoadingWidget();
        }

        final items = viewModel.sessionList;

        return Scaffold(
          appBar: SearchAppBar(
            title: const Text("Lấy hàng"),
            hintText: "Tìm theo mã hàng",
            centerTitle: true,
            onChanged: (value) {
              ///
            },
          ),
          body: InsidePullToRefreshWidget(
            handlerPull: () {
              viewModel.fetchData();
            },
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return _pickItem(context, viewModel, items[index]);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _pickItem(BuildContext context, PickingListScreenViewModel viewModel,
      ORViewItem item) {
    return Text(item.code!);
  }
}
