import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/models/index.dart';
import 'package:warehouse_app/utils/index.dart';
import 'package:warehouse_app/view_models/receive_view_model.dart';
import 'package:warehouse_app/widgets/index.dart';
import 'package:warehouse_app/widgets/search_appbar.dart';

class ReceiveListScreen extends StatelessWidget {
  const ReceiveListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return ReceiveScreenViewModel();
      },
      onModelReady: (ReceiveScreenViewModel viewModel) {
        viewModel.init();
      },
      builder: (BuildContext context, ReceiveScreenViewModel viewModel, _) {
        if (viewModel.isBusy) {
          return Container(
            child: const LoadingWidget(),
            color: Colors.white,
          );
        }
        return Stack(
          children: [
            Scaffold(
              appBar: SearchAppBar(
                title: Text("List Check-in"),
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

  Widget _listItem(BuildContext context, ReceiveScreenViewModel viewModel,
      ReceiveModel model) {
    final vGap = SizedBox(
      height: 8,
    );
    return RoundedContainer(
        backgroundColor: Colors.grey[300],
        innerPadding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Text(
                StringFormat.hm(model.createdDate),
                style: TextStyle(fontWeight: FontWeight.bold),
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    vGap,
                    Text(
                      "${model.code} - ${model.irCode}",
                      style: TextStyle(fontSize: 10, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () {
                  viewModel.showCondition(context, model);
                },
                child: Text("Receive"),
              )
            ],
          ),
        ));
  }
}
