part of 'coupon_bloc.dart';

@immutable
abstract class CouponEvent {}

class CreateCouponsEvent extends CouponEvent {
  final List<NewCouponParam> param;

  CreateCouponsEvent(this.param);
}
