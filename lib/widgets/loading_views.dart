import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warehouse_app/utils/index.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  final String? text;
  final Color? color;
  final Color? textColor;

  const LoadingWidget({
    Key? key,
    this.size = IconSizes.xl,
    this.text,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size,
              height: size,
              child: Platform.isAndroid
                  ? CircularProgressIndicator(
                      strokeWidth: 2,
                      color: color ?? Colors.grey,
                    )
                  : CupertinoActivityIndicator(color: color),
            ),
            if (!text.isNullOrEmptyEx())
              Text(
                text!,
                style: TextStyle(
                  color: textColor,
                ),
              )
          ],
        ),
      ),
    );
  }
}
