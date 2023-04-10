import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/screens/repick/repick_screen_view_model.dart';

class RepickScreen extends StatelessWidget {
  const RepickScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: () {
      return RepickScreenViewModel();
    }, builder: (BuildContext context, RepickScreenViewModel viewModel, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Lấy lại hàng"),
            centerTitle: true,
          ),
          body: const Placeholder());
    });
  }
}
