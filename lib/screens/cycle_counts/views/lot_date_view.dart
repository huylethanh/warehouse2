import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

class LotDateView extends StatelessWidget {
  final CycleCountProduct product;

  const LotDateView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedContainer(
          backgroundColor: AppColor.color3D3D3D,
          child: Row(
            children: [
              RoundedContainer(
                backgroundColor: AppColor.color636366,
                height: 70,
                width: 70,
                child: Image.network(
                  product.avatarURL ?? "",
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FieldValue(
                    fieldName: const Text("Tên sản phẩm:"),
                    value: Text(product.productName ?? ""),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FieldValue(
                    fieldName: const Text("Mã sản phẩm:"),
                    value: Text(
                      product.barcode ?? "",
                      style: const TextStyle(color: Colors.green, fontSize: 20),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        RichText(
          text: const TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  FontAwesomeIcons.circleInfo,
                  size: 15,
                  color: Colors.red,
                ),
              ),
              TextSpan(
                  text: "   Vui lòng kiểm tra thông tin trước khi xác nhận",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.redAccent,
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: SplashButtonWidget(
                    borderRadius: const Radius.circular(10),
                    innerPadding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 8),
                    color: Colors.green,
                    child: const Text("Xác nhận"),
                    onPressed: () {}),
              ),
              Expanded(
                child: SplashButtonWidget(
                  borderRadius: const Radius.circular(10),
                  innerPadding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 8),
                  color: Colors.red,
                  child: const Text("Đóng"),
                  onPressed: () {},
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
