import 'package:admin/core/enums/subscription_duration.dart';
import 'package:flutter/material.dart';

import '../dashboard/data/models/coupon_provider.dart';
import '../dashboard/data/models/params/new_coupon_param.dart';
import 'components/new_coupon_item.dart';

class NewCouponScreen extends StatefulWidget {
  static const routeName = "/new-coupon-screen";

  const NewCouponScreen({super.key});

  @override
  State<NewCouponScreen> createState() => _NewCouponScreenState();
}

class _NewCouponScreenState extends State<NewCouponScreen> {
  List<NewCouponParam> coupons = [NewCouponParam(id: 1)];
  List<CouponProvider> providers = [
    CouponProvider(name: "Sporty Bet", slug: "sporty_bet"),
    CouponProvider(name: "Bet Naija", slug: "bet_naija"),
  ];

  void onExpiryDateChangeHandler(NewCouponParam updatedCoupon) {
    // int index = coupons.indexWhere((coupon) => coupon.id == updatedCoupon.id);
    // coupons.removeAt(index);
    // setState(() {
    //   coupons.insert(index, updatedCoupon);
    // });
    print("The selected time is =========>>>>>> ${updatedCoupon.expiresAt}");
    setState(() {});
  }

  void addNewCouponHandler() {
    var coupon = NewCouponParam(
      id: coupons.length,
      active: true,
      month: true,
      week: true,
      year: true,
      description: "",
      code: "",
    );
    setState(() {
      coupons.insert(0, coupon);
    });
  }

  void removeCoupon(int couponId) {
    if (coupons.length == 1) {
      Navigator.of(context).pop();
      return;
    }

    print("coupon id is $couponId");
    int index = coupons.indexWhere((coupon) => couponId == coupon.id);
    if (coupons.isNotEmpty) {
      setState(() {
        coupons.removeAt(index);
      });
    }
  }

  void statusChangedHandler(NewCouponParam newCoupon, bool? value) {
    int foundIndex = coupons.indexWhere((coupon) => coupon.id == newCoupon.id);
    if (foundIndex < 0) return;
    newCoupon.active = value;
    setState(() {
      coupons[foundIndex] = newCoupon;
    });
  }

  void setCode(NewCouponParam newCoupon, String value) {
    int foundIndex = coupons.indexWhere((coupon) => coupon.id == newCoupon.id);
    if (foundIndex < 0) return;
    newCoupon.code = value;
    setState(() {
      coupons[foundIndex] = newCoupon;
    });
  }

  void setDescription(NewCouponParam newCoupon, String value) {
    int foundIndex = coupons.indexWhere((coupon) => coupon.id == newCoupon.id);
    if (foundIndex < 0) return;
    newCoupon.description = value;
    setState(() {
      coupons[foundIndex] = newCoupon;
    });
  }

  void durationHandler(
      NewCouponParam newCoupon, SubscriptionDuration duration, bool? value) {
    int foundIndex = coupons.indexWhere((coupon) => coupon.id == newCoupon.id);
    if (foundIndex < 0) return;
    switch (duration) {
      case SubscriptionDuration.week:
        newCoupon.week = value;
        break;
      case SubscriptionDuration.month:
        newCoupon.month = value;
        break;
      case SubscriptionDuration.year:
        newCoupon.year = value;
        break;
      default:
        newCoupon.year = newCoupon.month = newCoupon.week = false;
        print("Invalid subscription duration. $duration");
    }
    setState(() {
      coupons[foundIndex] = newCoupon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: coupons
                .map((coupon) => NewCouponItem(
                      removeHandler: removeCoupon,
                      validateHandler: (newCoupon) {},
                      statusChangedHandler: statusChangedHandler,
                      durationHandler: durationHandler,
                      newCouponHandler: addNewCouponHandler,
                      setCode: setCode,
                      expiryDateHandler: onExpiryDateChangeHandler,
                      setDescription: setDescription,
                      coupon: coupon,
                      providers: providers,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
