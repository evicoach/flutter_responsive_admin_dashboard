import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../usecases/usecase.dart';
import '../../data/models/coupon_model.dart';
import '../repositories/dashboard_repository.dart';

class FetchCoupons
    extends UseCase<List<CouponModel>, NoParams> {
  final DashboardRepository repository;

  FetchCoupons({required this.repository});

  @override
  Future<Either<Failure, List<CouponModel>>> call(
      NoParams params) async {
    return await repository.fetchCoupons(params);
  }
}