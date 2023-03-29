import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loading_widget.dart';

class BlurLoadingWidget extends StatelessWidget {
  final String? text;
  const BlurLoadingWidget({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Platform.isAndroid
                ? const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.grey,
                  )
                : const CupertinoActivityIndicator(color: Colors.grey),
            const SizedBox(
              height: 20,
            ),
            Text(
              text ?? "Processing",
              style: const TextStyle(
                fontSize: 15,
                decoration: TextDecoration.none,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
