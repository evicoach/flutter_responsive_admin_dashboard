part of 'coupon_bloc.dart';

@immutable
abstract class CouponState {}

class CouponInitial extends CouponState {}


class CreatingCoupons extends CouponState {}

class CreateCouponsError extends CouponState {
  final String? message;
  final Map<String, dynamic>? data;

  CreateCouponsError({this.message, this.data});
}



class CreateCouponsSuccess extends CouponState {
  final String? message;
  final List<CouponModel> data;

  CreateCouponsSuccess(this.message, {required this.data});
}