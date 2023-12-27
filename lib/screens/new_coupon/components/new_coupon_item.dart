import 'package:admin/constants.dart';
import 'package:admin/core/enums/subscription_duration.dart';
import 'package:admin/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/dropdown_widget.dart';
import '../../../core/presentation/app_widget.dart';
import '../../../utility/ui_utils.dart';
import '../../dashboard/data/models/coupon_provider.dart';
import '../../dashboard/data/models/params/new_coupon_param.dart';

class NewCouponItem extends StatefulWidget {
  final NewCouponParam coupon;
  final List<CouponProvider> providers;
  final Function(int couponId) removeHandler;
  final Function() newCouponHandler;
  final Function(NewCouponParam coupon) expiryDateHandler;
  final Function(NewCouponParam coupon)? validateHandler;
  final Function(NewCouponParam coupon, bool value) statusChangedHandler;
  final Function(
          NewCouponParam coupon, SubscriptionDuration duration, bool? value)
      durationHandler;
  final Function(NewCouponParam coupon, String value) setCode;
  final Function(NewCouponParam coupon, String value) setDescription;

  const NewCouponItem({
    super.key,
    required this.providers,
    required this.coupon,
    required this.removeHandler,
    required this.statusChangedHandler,
    required this.newCouponHandler,
    required this.expiryDateHandler,
    required this.validateHandler,
    required this.durationHandler,
    required this.setCode,
    required this.setDescription,
  });

  @override
  State<NewCouponItem> createState() => _NewCouponItemState();
}

class _NewCouponItemState extends State<NewCouponItem> {
  // final _dateFormat = DateFormat('yyyy-MM-dd');
  var selectedDate = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
          bottom: defaultPadding,
          top: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => widget.removeHandler(widget.coupon.id!),
              child: const Icon(Icons.close),
            ),
          ),
          const SizedBox(height: 8),
          DropdownWidget<CouponProvider>(
              elements: widget.providers,
              maxChildSize: 0.6,
              loadStatus: false,
              itemBuilder: (item) => Text(
                    "${item.name}",
                    style: TextStyle(color: bgColor),
                  ),
              selectedElementBuilder: (item) => Text(
                    "${item.name}",
                    style: TextStyle(color: bgColor),
                  ),
              hint: const Text(
                "Select bet provider",
                style: TextStyle(color: bgColor),
              ),
              whenElementSelected: (item) {
                print("${item.toJson()} has been selected.");
                widget.coupon.provider = (item as CouponProvider).slug;
              }),
          SizedBox(height: defaultPadding/2),
          Row(
            children: [
              const Text(
                "Status",
                style: TextStyle(color: AppColors.appGreen),
              ),
              CupertinoSwitch(
                  value: widget.coupon.active == true,
                  onChanged: (value) =>
                      widget.statusChangedHandler(widget.coupon, value)),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color(0xFFEDEDED),
          ),
          const Text("Subscribers"),
          Row(
            children: [
              Checkbox(
                  value:
                      widget.coupon.week != null ? widget.coupon.week : false,
                  onChanged: (value) => widget.durationHandler(
                      widget.coupon, SubscriptionDuration.week, value)),
              const Text("Weekly")
            ],
          ),
          Row(
            children: [
              Checkbox(
                  value:
                      widget.coupon.month != null ? widget.coupon.month : false,
                  onChanged: (value) => widget.durationHandler(
                      widget.coupon, SubscriptionDuration.month, value)),
              const Text("Monthly")
            ],
          ),
          Row(
            children: [
              Checkbox(
                  value:
                      widget.coupon.year != null ? widget.coupon.year : false,
                  onChanged: (value) => widget.durationHandler(
                      widget.coupon, SubscriptionDuration.year, value)),
              const Text("Yearly")
            ],
          ),
          const SizedBox(height: 20),
          AppWidget.buildUserInput(
              hint: "Coupon",
              onChanged: (value) => widget.setCode(widget.coupon, value)),
          const SizedBox(height: 20),
          AppWidget.buildUserInput(
              hint: "Description",
              maxLines: 4,
              onChanged: (value) =>
                  widget.setDescription(widget.coupon, value)),
          const SizedBox(height: 20),
          Row(
            children: [
              GestureDetector(
                  onTap: () async {
                    DateTime? expiryTime =
                        await showDateTimePicker(context: context);
                    print("The chosen expiry time ${expiryTime}");
                    widget.coupon.expiresAt = expiryTime?.toIso8601String();
                    selectedDate = widget.coupon.expiresAt!;
                    widget.expiryDateHandler(widget.coupon);
                  },
                  child: Container(
                    child: Text("Select Expiry time"),
                  )),
              const Spacer(),
              GestureDetector(
                onTap: widget.newCouponHandler,
                child: Container(
                  margin: const EdgeInsets.only(right: 18.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_circle,
                        color: AppColors.appGreen,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Add new Coupon",
                        style: TextStyle(color: AppColors.appGreen),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          if (selectedDate.isNotEmpty)
            Text(selectedDate, style: TextStyle(color: AppColors.appGreen)),
          const Divider(
            thickness: 1,
            color: Color(0xFFEDEDED),
          ),
        ],
      ),
    );
  }
}
