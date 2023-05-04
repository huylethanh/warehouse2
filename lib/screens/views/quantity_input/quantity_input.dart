import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/base/view_models/index.dart';

class QuantityInput extends StatelessWidget {
  final Widget? child;
  const QuantityInput({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: () {
      return _QuantityInputViewModel();
    }, builder: (BuildContext context, _QuantityInputViewModel viewModel, _) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Material(
          child: Column(
            children: [
              if (child != null) ...[
                child!,
              ],
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Số lượng",
                  labelStyle: TextStyle(fontSize: 15),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                ),
                onFieldSubmitted: (value) {
                  viewModel.onSubmit(context);
                },
                onChanged: (value) {
                  viewModel.textChange(value);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.onSubmit(context);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                child: const Text("OK"),
              )
            ],
          ),
        ),
      );
    });
  }
}

class _QuantityInputViewModel extends ViewModelBase {
  String text = "0";
  void textChange(String text) {
    this.text = text;
  }

  void onSubmit(BuildContext context) {
    int? number = int.tryParse(text);
    number ??= 0;

    Navigator.pop(context, number);
  }
}
