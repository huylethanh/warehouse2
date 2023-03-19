import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import 'package:warehouse_app/models/index.dart';
import 'package:warehouse_app/utils/index.dart';
import 'package:warehouse_app/view_models/index.dart';
import 'package:warehouse_app/widgets/index.dart';

class ConditionTypeScreen extends StatelessWidget {
  final ReceiveModel model;
  final List<ConditionType> conditions;

  const ConditionTypeScreen(
      {super.key, required this.model, required this.conditions});

  @override
  Widget build(BuildContext context) {
    const vGap = SizedBox(
      height: 8,
    );

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ChooseConditionScreeViewModel(
          conditions: conditions, receiveModel: model),
      builder: (BuildContext context, ChooseConditionScreeViewModel viewModel,
          Widget? child) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              RoundedContainer(
                backgroundColor: Colors.grey[300],
                innerPadding: EdgeInsets.all(8),
                //  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            vGap,
                            Text(
                              "${model.code} - ${model.irCode}",
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              vGap,
              DropdownButton<ConditionType>(
                icon: const Icon(
                  FontAwesomeIcons.chevronDown,
                  size: 15,
                ),
                isExpanded: true,
                value: viewModel.selectedCondion,
                items: viewModel.conditions
                    .map((e) => DropdownMenuItem<ConditionType>(
                          value: e,
                          child: Text(e.conditionTypeName!),
                        ))
                    .toList(),
                onChanged: (selected) {
                  viewModel.selectedCondion = selected;
                  viewModel.notifyListeners();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    child: Text("Back"),
                  ),
                  ElevatedButton(
                    onPressed: viewModel.validate()
                        ? () {
                            viewModel.goToReceiveSession(context);
                          }
                        : null,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text("Confirm"),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
