import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';
import 'app_widget.dart';

class AppButton extends StatelessWidget {
  final bool enabled;
  final String text;

  // final IconData? icon;
  final Widget? icon;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? fontColor;
  final Color? iconColor;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final MainAxisAlignment mainAxisAlignment;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.text,
    this.enabled = false,
    this.iconColor,
    this.fontWeight,
    this.icon,
    this.onPressed,
    this.backgroundColor,
    this.fontColor,
    this.borderColor,
    this.fontSize,
    this.padding,
    this.margin,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    this.width,
  });

  _onPressed() {
    if (isLoading) {
      return;
    }
    onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height ?? 42,
      width: width,
      child: TextButton(
          onPressed: enabled ? _onPressed : null,
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  padding ?? const EdgeInsets.symmetric(horizontal: 16)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                side: enabled
                    ? BorderSide(
                        color: borderColor ??
                            backgroundColor ??
                            Theme.of(context).primaryColor)
                    : BorderSide(color: Colors.grey.withOpacity(.6)),
                borderRadius: borderRadius ?? BorderRadius.circular(10.0),
              )),
              backgroundColor: MaterialStateProperty.all(
                  enabled ? backgroundColor : Colors.grey.withOpacity(.6))),
          child: isLoading
              ? Center(
                  child: AppWidget.loadingIndicator(color: AppColors.white))
              : Row(
                  mainAxisAlignment: mainAxisAlignment,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        text,
                        style: TextStyle(
                          color: enabled
                              ? fontColor ?? AppColors.white
                              : AppColors.white,
                          fontSize: fontSize ??
                              13 * MediaQuery.of(context).textScaleFactor,
                          fontWeight: fontWeight ?? FontWeight.normal,
                        ),
                      ),
                    ),
                    if (icon != null) icon!
                    // Icon(
                    //   icon,
                    //   size: 15,
                    //   color: iconColor??AppColors.white,
                    // )
                  ],
                )),
    );
  }
}
