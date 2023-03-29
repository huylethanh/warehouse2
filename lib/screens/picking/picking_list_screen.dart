import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/screens/picking/picking_list_screen_view_model.dart';
import 'package:warehouse_app/widgets/inside_pull_to_refresh_widget.dart';
import 'package:warehouse_app/widgets/search_appbar.dart';

class PickingListScreen extends StatelessWidget {
  const PickingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return PickingListScreenViewModel();
      },
      builder: (BuildContext context, PickingListScreenViewModel viewModel, _) {
        return Scaffold(
          appBar: SearchAppBar(
            title: Text("Lấy hàng"),
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
              child: Container()),
        );
      },
    );
  }
}
