// import 'package:flutter/material.dart';
// import 'package:skeleton_text/skeleton_text.dart';
//
// class SkeletonContainer extends StatelessWidget {
//   final double width;
//   final double height;
//   final BorderRadius borderRadius;
//
//   const SkeletonContainer._({
//     this.width = double.infinity,
//     this.height = double.infinity,
//     this.borderRadius = const BorderRadius.all(Radius.circular(15)),
//   });
//
//   const SkeletonContainer.square({
//     double width = double.infinity,
//     double height = double.infinity,
//     BorderRadius borderRadius = const BorderRadius.all(Radius.circular(15)),
//   }) : this._(
//           width: width,
//           height: height,
//           borderRadius: borderRadius,
//         );
//
//   SkeletonContainer.rounded({
//     double width = double.infinity,
//     double height = double.infinity,
//     BorderRadius borderRadius = const BorderRadius.all(Radius.circular(15)),
//   }) : this._(
//           width: width,
//           height: height,
//           borderRadius: borderRadius =
//               const BorderRadius.all(Radius.circular(15)),
//         );
//
//   @override
//   Widget build(BuildContext context) {
//     return SkeletonAnimation(
//       child: Container(
//         width: width,
//         height: height,
//         decoration:
//             BoxDecoration(color: Colors.grey[300], borderRadius: borderRadius),
//       ),
//     );
//   }
// }
