import 'package:catbreeds/core/error/error_failures.dart';
import 'package:catbreeds/data/datasource/datasource.dart';
import 'package:catbreeds/domain/entities/entity_cat.dart';
import 'package:catbreeds/domain/repositories/repository_cats.dart' as domain;
import 'package:catbreeds/utils/functions/func_common.dart' as utils;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RepositoryCatsImpl implements domain.RepositoryCats {
  final DatasourceRemoteCats datasource;

  const RepositoryCatsImpl(this.datasource);

  @override
  Future<Either<Failure, List<CatEntity>>> get(
      int limit, String breed, int page) async {
    try {
      final result = await datasource.get(limit, breed, page);
      return Right(result);
    } on DioException catch (e) {
      return Left(
        Failure(
          code: utils.isNullOrEmpty(e.response)
              ? "400"
              : e.response!.statusCode.toString(),
          message: utils.isNullOrEmpty(e.response)
              ? "Error al obtener la información."
              : (e.response!.statusCode == 500
                  ? e.response!.data
                  : e.response!.data['message']),
        ),
      );
    }
  }
}
