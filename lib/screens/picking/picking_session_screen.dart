import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/screens/picking/picking_list_screen_view_model.dart';
import 'package:warehouse_app/screens/picking/picking_session_screen_view_model.dart';

class PickingSessionScreen extends StatelessWidget {
  final ORPicking orPicking;
  const PickingSessionScreen({
    super.key,
    required this.orPicking,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return PickingSessionScreenViewModel(orPicking);
      },
      builder:
          (BuildContext context, PickingSessionScreenViewModel viewModel, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Nhận Hàng"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  //
                },
                color: Colors.amber,
                icon: Icon(FontAwesomeIcons.forward),
              )
            ],
          ),
          body: Placeholder(),
        );
      },
    );
  }
}
