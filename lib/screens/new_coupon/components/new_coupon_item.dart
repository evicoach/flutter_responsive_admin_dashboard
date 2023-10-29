import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/dropdown_widget.dart';
import '../../../core/presentation/app_widget.dart';
import '../../dashboard/data/models/coupon_provider.dart';
import '../../dashboard/data/models/params/new_coupon_param.dart';

class NewCouponItem extends StatefulWidget {
  final NewCouponParam coupon;
  final List<CouponProvider> providers;
  final Function(String? couponId) removeHandler;
  final Function(NewCouponParam coupon)? validateHandler;
  final Function(NewCouponParam coupon, bool value) statusChangedHandler;
  final Function(NewCouponParam coupon, String duration, bool? value)
      durationHandler;

  const NewCouponItem({
    super.key,
    required this.providers,
    required this.coupon,
    required this.removeHandler,
    required this.statusChangedHandler,
    required this.validateHandler,
    required this.durationHandler,
  });

  @override
  State<NewCouponItem> createState() => _NewCouponItemState();
}

class _NewCouponItemState extends State<NewCouponItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: DropdownWidget<CouponProvider>(
              elements: widget.providers,
              maxChildSize: 0.6,
              loadStatus: false,
              itemBuilder: (item) => Text("${item.name}"),
              selectedElementBuilder: (item) => Text("${item.name}"),
              hint: const Text("Select bet provider"),
              whenElementSelected: (item) {}),
        ),
        CupertinoSwitch(
            value: widget.coupon.active == true,
            onChanged: (value) =>
                widget.statusChangedHandler(widget.coupon, value)),
        const Divider(
          thickness: 1,
          color: Color(0xFFEDEDED),
        ),
        const Text("Subscribers"),
        Row(
          children: [
            Checkbox(
                value: widget.coupon.week,
                onChanged: (value) =>
                    widget.durationHandler(widget.coupon, "week", value)),
            const Text("Weekly")
          ],
        ),
        Row(
          children: [
            Checkbox(
                value: widget.coupon.month,
                onChanged: (value) =>
                    widget.durationHandler(widget.coupon, "month", value)),
            const Text("Monthly")
          ],
        ),
        Row(
          children: [
            Checkbox(
                value: widget.coupon.year,
                onChanged: (value) =>
                    widget.durationHandler(widget.coupon, "year", value)),
            const Text("Yearly")
          ],
        ),
        const SizedBox(height: 20),
        AppWidget.buildUserInput(hint: "Coupon", onChanged: (val) {}),
        const SizedBox(height: 20),
        const SizedBox(height: 20),
        AppWidget.buildUserInput(hint: "Description", onChanged: (val){}),
        const SizedBox(height: 20),
      ],
    );
  }
}
