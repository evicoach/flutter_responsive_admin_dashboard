import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/model/api_response.dart';
import '../../../../usecases/usecase.dart';
import '../../data/models/params/login_params.dart';
import '../../data/models/user_model.dart';
import '../repositories/auth_repository.dart';

class Login
    extends UseCase<ApiResponse<UserModel>, LoginParams> {
  final AuthRepository repository;

  Login({required this.repository});

  @override
  Future<Either<Failure, ApiResponse<UserModel>>> call(
      LoginParams params) async {
    return await repository.login(params);
  }
}
