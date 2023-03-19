import 'package:flutter/material.dart';

class SplashButtonWidget extends StatelessWidget {
  final Color? color;
  final Radius? borderRadius;

  /// Allow to use non-circular border radius (e.g only round top left, top right)
  final BorderRadius? circularBorderRadius;
  final Function()? onPressed;
  final Widget child;
  final EdgeInsets? innerPadding;
  final Color? splashColor;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final bool disabled;
  final Color? borderColor;
  final double elevation;
  final Alignment childAlign;
  final Color? disableColor;
  final double borderThickness;
  final BoxConstraints? constraints;

  const SplashButtonWidget({
    required this.child,
    required this.onPressed,
    this.color,
    this.borderRadius,
    this.innerPadding,
    this.splashColor,
    this.margin = EdgeInsets.zero,
    this.width,
    this.height,
    this.disabled = false,
    this.borderColor,
    this.elevation = 0.0,
    this.childAlign = Alignment.center,
    this.disableColor,
    this.borderThickness = 0.0,
    this.circularBorderRadius,
    this.constraints,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDisable = (disabled || onPressed == null);
    return Container(
      margin: margin,
      constraints: constraints,
      child: Material(
        elevation: elevation,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          side: borderColor != null
              ? BorderSide(color: borderColor!, width: borderThickness)
              : BorderSide.none,
          borderRadius: circularBorderRadius != null
              ? circularBorderRadius!
              : (borderRadius != null
                  ? BorderRadius.all(borderRadius!)
                  : BorderRadius.zero),
        ),
        color: isDisable ? (disableColor ?? Colors.grey) : color,
        child: InkWell(
          splashColor: splashColor,
          onTap: isDisable ? null : onPressed,
          child: Container(
            padding: innerPadding,
            alignment: childAlign,
            constraints: constraints,
            child: child,
          ),
        ),
      ),
    );
  }
}
