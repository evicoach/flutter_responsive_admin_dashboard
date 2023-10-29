import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/model/api_response.dart';
import '../../../../usecases/usecase.dart';
import '../../data/models/user_model.dart';
import '../repositories/auth_repository.dart';

class FetchUserInfo extends UseCase<ApiResponse<UserModel>, NoParams> {
  final AuthRepository repository;

  FetchUserInfo({required this.repository});

  @override
  Future<Either<Failure, ApiResponse<UserModel>>> call(NoParams params) async {
    return await repository.fetchUserInfo(params);
  }
}
