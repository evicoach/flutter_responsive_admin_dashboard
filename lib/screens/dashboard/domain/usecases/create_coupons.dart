import 'package:admin/screens/dashboard/data/models/params/new_coupon_param.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../usecases/usecase.dart';
import '../../data/models/coupon_model.dart';
import '../repositories/dashboard_repository.dart';

class CreateCoupons extends UseCase<List<CouponModel>, List<NewCouponParam>> {
  final DashboardRepository repository;

  CreateCoupons({required this.repository});

  @override
  Future<Either<Failure, List<CouponModel>>> call(
      List<NewCouponParam> params) async {
    return await repository.createCoupons(params);
  }
}
