import 'package:dartz/dartz.dart';
import 'package:catbreeds/core/error/error_failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
