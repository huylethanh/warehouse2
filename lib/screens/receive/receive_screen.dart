import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/screens/receive/receive_screen_view_model.dart';

class ReceiveScreen extends StatelessWidget {
  const ReceiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return ReceiveScreenViewModel();
      },
      builder: (BuildContext context, ReceiveScreenViewModel viewModel, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Nhận Hàng"),
          ),
          body: Text("abc"),
        );
      },
    );
  }
}
