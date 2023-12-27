import 'package:admin/screens/dashboard/data/models/coupon_model.dart';
import 'package:admin/screens/dashboard/data/models/params/new_coupon_param.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecases/create_coupons.dart';

part 'coupon_event.dart';

part 'coupon_state.dart';

class CouponBloc extends Bloc<CouponEvent, CouponState> {
  final CreateCoupons createCoupons;

  CouponBloc(this.createCoupons) : super(CouponInitial()) {
    on<CouponEvent>((event, emit) {});
    on<CreateCouponsEvent>(_onCreateCouponsHandler);
  }

  void _onCreateCouponsHandler(CreateCouponsEvent event, emit) async {
    emit(CreatingCoupons());
    var userInfoOrFailure = await createCoupons(event.param);
    userInfoOrFailure.fold((failure) {
      failure as ServerFailure;
      emit(CreateCouponsError(message: failure.message, data: failure.data));
    }, (data) => emit(CreateCouponsSuccess("Coupons created", data: data)));
  }
}
