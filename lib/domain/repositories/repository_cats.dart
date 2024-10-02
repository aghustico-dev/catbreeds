import 'package:dartz/dartz.dart';

import 'package:catbreeds/core/error/error_failures.dart';
import 'package:catbreeds/domain/entities/entity.dart' as entity;

abstract class RepositoryCats {
  Future<Either<Failure, List<entity.CatEntity>>> get(
      int limit, String breed, int page);
}
