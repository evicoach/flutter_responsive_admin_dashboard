import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../utility/app_colors.dart';
import 'skeleton_container.dart';

class AppImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool isNetwork;
  final BorderRadius borderRadius;
  final Color? color;
  final Widget? errorImage;

  const AppImage({
    super.key,
    required this.path,
    this.errorImage,
    this.color,
    this.width,
    this.height,
    this.fit,
    this.borderRadius = BorderRadius.zero,
    this.isNetwork = false,
  });

  @override
  Widget build(BuildContext context) {
    int extensionIndex = path.lastIndexOf(".");
    String extension = path.substring(extensionIndex + 1);
    return ClipRRect(
      borderRadius: borderRadius,
      child: isNetwork
          ? extension.toLowerCase().contains("svg")
              ? SvgPicture.network(
                  color: color,
                  // theme: SvgTheme(currentColor: color),
                  path,
                  fit: BoxFit.cover,
                  height: height,
                  width: width,
                )
              // ScalableImageWidget.fromSISource(
              //     si: ScalableImageSource.fromSvgHttpUrl(Uri.parse(path)))
              : CachedNetworkImage(
                  imageUrl: path,
                  width: width,
                  height: height,
                  fit: fit ?? BoxFit.cover,
                  // placeholder: (context, url) => SkeletonContainer.rounded(),
                  errorWidget: (context, url, error) => Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                        // color: Colors.grey[300],
                        borderRadius: borderRadius),
                    child: Center(
                      child: errorImage ??
                          const Icon(
                            Icons.error,
                            color: AppColors.appGreen,
                            size: 30,
                          ),
                    ),
                  ),
                )
          : extension.toLowerCase().contains("svg")
              ?
              // ScalableImageWidget.fromSISource(
              //             si: ScalableImageSource.fromSvg(
              //                 DefaultAssetBundle.of(context), path))
              SvgPicture.asset(
                  color: color,
                  // theme: SvgTheme(currentColor: color),
                  path,
                  height: height,
                  width: width,
                )
              : Image(
                  width: width,
                  height: height,
                  image: AssetImage(path),
                  fit: fit ?? BoxFit.cover,
                ),
    );
  }
}
