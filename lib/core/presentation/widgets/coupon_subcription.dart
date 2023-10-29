import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/text_styles.dart';

class CouponSubscription extends StatefulWidget {
  final String title;
  final String description;
  final String assetName;
  final Color color;

  final void Function() onTap;

  const CouponSubscription({
    super.key,
    required this.title,
    required this.description,
    required this.color,
    required this.assetName,
    required this.onTap,
  });

  @override
  State<CouponSubscription> createState() => _CouponSubscriptionState();
}

class _CouponSubscriptionState extends State<CouponSubscription> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        decoration: BoxDecoration(
          color: widget.color.withOpacity(0.1),
          border: Border.all(color: widget.color.withOpacity(0.7)),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            bottom: 15,
            left: 20,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '₦100/week',
                      style: subHeaderStyle(color: widget.color),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.description,
                      style:
                          smallBodyStyle(color: widget.color.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SvgPicture.asset(
                  widget.assetName,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
