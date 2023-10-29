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
  List<NewCouponParam> newCoupons = [NewCouponParam()];
  List<CouponProvider> providers = [
    CouponProvider(name: "Sporty Bet", slug: "sporty_bet"),
    CouponProvider(name: "Bet Naija", slug: "bet_naija"),
  ];

  void statusChangedHandler(NewCouponParam couponParam, bool? value) {}

  void durationHandler(
      NewCouponParam couponParam, String duration, bool? value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: newCoupons
              .map((coupon) => NewCouponItem(
                    removeHandler: (newCouponId) {},
                    validateHandler: (newCoupon) {},
                    statusChangedHandler: statusChangedHandler,
                    durationHandler: durationHandler,
                    coupon: coupon,
                    providers: providers,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
