import 'package:dartz/dartz.dart';

import 'package:catbreeds/core/core.dart' as core;
import 'package:catbreeds/domain/domain.dart' as domain;

class UsecaseCatsGet
    implements core.UseCase<List<domain.CatEntity>, core.Params> {
  final domain.RepositoryCats repository;
  UsecaseCatsGet(this.repository);

  @override
  Future<Either<core.Failure, List<domain.CatEntity>>> call(
      core.Params params) async {
    return await repository.get(params.limit!, params.breed!, params.page!);
  }
}
