import 'package:dartz/dartz.dart';

import '../core/data/model/params.dart';
import '../core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Params {}
