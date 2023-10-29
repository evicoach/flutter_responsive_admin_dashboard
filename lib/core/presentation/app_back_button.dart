import 'package:flutter/material.dart';
import '../../utility/app_assets.dart';
import 'app_image.dart';

class AppBackButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;
  final Widget? icon;
  final EdgeInsetsGeometry? margin;

  const AppBackButton({
    Key? key,
    this.onTap,
    this.color,
    this.margin,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      child: Container(
          margin: margin,
          child: icon ?? const AppImage(path: AppAssets.arrowBack)),
    );
  }
}
