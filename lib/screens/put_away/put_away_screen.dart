import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'put_away_screen_view_model.dart';

class PutAwayScreen extends StatelessWidget {
  const PutAwayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return PutAwayScreenViewModel();
      },
      builder: (BuildContext context, PutAwayScreenViewModel viewModel, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Lưu Kho"),
          ),
          body: Text("abc"),
        );
      },
    );
  }
}
