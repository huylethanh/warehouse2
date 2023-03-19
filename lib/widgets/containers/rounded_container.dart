import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsets innerPadding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderThickness;
  final double? height;
  final double? width;
  final Clip? clipBehavior;
  final Alignment? childAlignment;
  final double elevation;

  const RoundedContainer({
    Key? key,
    required this.child,
    this.borderRadius = 20,
    this.innerPadding = const EdgeInsets.all(10),
    this.backgroundColor,
    this.borderColor,
    this.borderThickness = 1,
    this.width,
    this.height,
    this.margin,
    this.clipBehavior,
    this.childAlignment,
    this.elevation = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (childAlignment == null) {
      body = child;
    } else {
      body = Align(
        alignment: childAlignment!,
        child: child,
      );
    }

    return Container(
      margin: margin,
      width: width,
      height: height,
      child: Material(
        elevation: elevation,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          side: borderColor != null
              ? BorderSide(color: borderColor!, width: borderThickness)
              : BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        color: backgroundColor,
        child: Padding(
          padding: innerPadding,
          child: body,
        ),
      ),
    );
  }
}
