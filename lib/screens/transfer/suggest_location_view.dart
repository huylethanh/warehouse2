import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/models/diff_bin_transfer_source_product.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/buttons/splash_button_widget.dart';
import 'package:warehouse_app/widgets/containers/index.dart';
import 'package:warehouse_app/widgets/loading_widget.dart';

import 'suggest_location_view_view_model.dart';

class SuggestLocationView extends StatelessWidget {
  final DiffBinTransferSourceProduct product;

  const SuggestLocationView({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () {
        return SuggestLocationViewViewModel(
          productId: product.productId!,
          conditionTypeId: product.conditionTypeId ?? 1,
          unitId: product.unitId ?? 0,
        );
      },
      onViewModelReady: (SuggestLocationViewViewModel viewModel) {
        viewModel.getSuggestLocation();
      },
      builder:
          (BuildContext context, SuggestLocationViewViewModel viewModel, _) {
        if (viewModel.isBusy) {
          return const LoadingWidget();
        }
        return _body(context, viewModel);
      },
    );
  }

  Widget _body(BuildContext context, SuggestLocationViewViewModel viewModel) {
    final suggestLocation = viewModel.suggestLocation;

    final list = suggestLocation?.configs ?? [];

    const itemVgap = SizedBox(
      height: 8,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedContainer(
                backgroundColor: AppColor.color636366,
                height: 70,
                width: 70,
                child: Image.network(
                  product.avatarUrl ?? "",
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      FontAwesomeIcons.image,
                      size: 40,
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      product.productName!,
                      maxLines: 2,
                      softWrap: true,
                    ),
                    itemVgap,
                    Text(
                      product.barcode!,
                      maxLines: 2,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
          itemVgap,
          if (list.isEmpty)
            const Text(
              "Chưa thiết lập khu vực lưu kho",
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
          SplashButtonWidget(
              margin: const EdgeInsets.only(top: 10),
              innerPadding: const EdgeInsets.symmetric(vertical: 12),
              borderRadius: const Radius.circular(10),
              color: Colors.green,
              child: const Text("Đóng"),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
