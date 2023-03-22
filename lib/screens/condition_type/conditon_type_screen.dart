import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/utils/index.dart';
import 'package:warehouse_app/widgets/drop_downs/drop_down.dart';
import 'package:warehouse_app/widgets/index.dart';

import 'conditionn_type_view_model.dart';

class ConditionTypeScreen extends StatelessWidget {
  final ReceiveModel model;
  final List<ConditionType> conditions;

  const ConditionTypeScreen(
      {super.key, required this.model, required this.conditions});

  @override
  Widget build(BuildContext context) {
    const vGap = SizedBox(
      height: 16,
    );

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ChooseConditionScreeViewModel(
          conditions: conditions, receiveModel: model),
      builder: (BuildContext context, ChooseConditionScreeViewModel viewModel,
          Widget? child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              RoundedContainer(
                backgroundColor: AppColor.gray,
                innerPadding: const EdgeInsets.all(8),
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
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${model.code} - ${model.irCode}",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              vGap,
              DropDowWidget<ConditionType>(
                value: viewModel.selectedCondion,
                items: viewModel.conditions,
                onChanged: (selected) {
                  viewModel.selectedCondion = selected;
                  viewModel.notifyListeners();
                },
                displayItemBuilder: (item) {
                  return Text(item!.conditionTypeName!);
                },
              ),
              vGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      "Quay Lại",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: viewModel.validate()
                        ? () {
                            viewModel.goToReceiveSession(context);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.secondary600,
                    ),
                    child: const Text(
                      "Xác Nhận",
                    ),
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
