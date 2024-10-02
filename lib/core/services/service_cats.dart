import 'package:catbreeds/core/params/param_with_params.dart';
import 'package:catbreeds/data/data.dart' as data;
import 'package:catbreeds/domain/domain.dart' as domain;

class CatsService {
  CatsService();

  final domain.UsecaseCatsGet _get = domain.UsecaseCatsGet(
      data.RepositoryCatsImpl(data.DatasourceRemoteCatsImpl()));

  Future<domain.ResponseEntity> getCats(
      int limit, String breed, int page) async {
    final result =
        await _get.call(Params(limit: limit, breed: breed, page: page));
    final responseEntity = domain.ResponseEntity();
    result.fold(
        (l) => responseEntity.errores = l, (r) => responseEntity.response = r);
    return responseEntity;
  }
}
