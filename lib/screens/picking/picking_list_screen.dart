import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/logics/logic_models/or_view_item.dart';
import 'package:warehouse_app/screens/picking/picking_list_screen_view_model.dart';
import 'package:warehouse_app/utils/constants.dart';
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
              viewModel.search(value);
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
    Color? priorityColor;
    if (item.priority == 2) {
      priorityColor = const Color(0xffF6931D);
    } else if (item.priority == 3) {
      priorityColor = const Color(0xffE20F0F);
    }

    return SplashButtonWidget(
      // splashColor: AppColor.color636366,
      borderRadius: const Radius.circular(10),
      color: AppColor.color636366,
      innerPadding: EdgeInsets.zero,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      onPressed: () {
        viewModel.startPicking(context, item.orPicking);
      },
      child: IntrinsicHeight(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //color: AppColor.color636366,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FieldValue(
                    fieldName: const Icon(
                      FontAwesomeIcons.box,
                      color: Colors.green,
                      size: 15,
                    ),
                    value: Text(
                      item.code!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FieldValue(
                    fieldName: const Icon(
                      FontAwesomeIcons.clock,
                      color: Colors.amber,
                      size: 15,
                    ),
                    value: Text(
                      viewModel.checkDate(item.createdDate ?? ""),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      item.sizeName ?? "",
                      style: const TextStyle(
                        fontSize: 48,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(left: 16),
                      child: Column(
                        children: [
                          const FieldValue(
                            fieldName: Text(
                              "Đơn hàng  /",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: Text(
                              "Sản phẩm",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          FieldValue(
                            fieldName: Text(
                              "${item.orAmount ?? '0'}  /",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            value: Text(
                              item.productAmount ?? '0',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        children: [
                          if (item.priority == 3)
                            const WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: 4.0),
                                child: Icon(
                                  FontAwesomeIcons.circleExclamation,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          TextSpan(
                              text: viewModel.setupPriority(item.priority!),
                              style: TextStyle(
                                fontSize: 24,
                                color: priorityColor,
                              ))
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
