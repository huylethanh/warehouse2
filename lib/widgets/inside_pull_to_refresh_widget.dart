import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:warehouse_app/utils/utils.dart';

import 'loading_widget.dart';

class InsidePullToRefreshWidget extends StatelessWidget {
  final Widget child;

  final Function handlerPull;

  final double iconSize;

  InsidePullToRefreshWidget(
      {Key? key,
      required this.child,
      required this.handlerPull,
      this.iconSize = 48})
      : super(key: key);

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    _refreshController.refreshCompleted();
    handlerPull();
    VibrateUtil.loadDataDone();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      header: CustomHeader(
        builder: (context, status) {
          return Container(
            alignment: Alignment.center,
            child: LoadingWidget(
              size: iconSize,
            ),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: child,
    );
  }
}
