import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/models/index.dart';
import 'package:warehouse_app/utils/index.dart';
import 'package:warehouse_app/view_models/receive_view_model.dart';
import 'package:warehouse_app/widgets/index.dart';
import 'package:warehouse_app/widgets/search_appbar.dart';

import 'receive_list_screen_view_model.dart';

class ReceiveListScreen extends StatelessWidget {
  const ReceiveListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return ReceiveListScreenViewModel();
      },
      onViewModelReady: (ReceiveListScreenViewModel viewModel) {
        viewModel.init();
      },
      builder: (BuildContext context, ReceiveListScreenViewModel viewModel, _) {
        if (viewModel.isBusy) {
          return Container(
            color: Colors.white,
            child: const LoadingWidget(),
          );
        }
        return Stack(
          children: [
            Scaffold(
              appBar: SearchAppBar(
                title: const Text("Danh Sách Check-in"),
                onChanged: (value) {
                  viewModel.search(value);
                },
                closeSearch: () {
                  viewModel.search(null);
                },
              ),
              body: ListView.builder(
                  itemCount: viewModel.receives.length,
                  itemBuilder: (BuildContext context, int index) {
                    final model = viewModel.receives[index];
                    return _listItem(context, viewModel, model);
                  }),
            ),
            if (viewModel.isProcessing) const BlurLoadingWidget(text: "Loading")
          ],
        );
      },
    );
  }

  Widget _listItem(BuildContext context, ReceiveListScreenViewModel viewModel,
      ReceiveModel model) {
    const vGap = SizedBox(
      height: 8,
    );
    return RoundedContainer(
        borderRadius: 10,
        backgroundColor: AppColor.gray,
        innerPadding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Text(
                StringFormat.hm(model.createdDate),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const VerticalDivider(
                color: Colors.grey,
                width: 20,
                thickness: 0.5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.shortName!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    vGap,
                    Text(
                      "${model.code} - ${model.irCode}",
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  viewModel.showCondition(context, model);
                },
                child: const Text("Nhận Hàng"),
              )
            ],
          ),
        ));
  }
}
