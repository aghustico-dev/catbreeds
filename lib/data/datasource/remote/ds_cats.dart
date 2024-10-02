import 'package:catbreeds/core/error/error_exceptions.dart';
import 'package:dio/dio.dart';

import 'package:catbreeds/data/models/model.dart' as model;
import 'package:catbreeds/utils/util.dart' as utils;

abstract class DatasourceRemoteCats {
  Future<List<model.CatModel>> get(int limit, String breed, int page);
}

class DatasourceRemoteCatsImpl implements DatasourceRemoteCats {
  DatasourceRemoteCatsImpl();

  @override
  Future<List<model.CatModel>> get(int limit, String breed, int page) async {
    Dio dio = await utils.dioInterceptos();
    String endPoint =
        '${utils.ApiEndpoint.api}/images/search?api_key=${utils.GlobalConstants.apiKey}&has_breeds=1&page=$page';

    if (limit > 0) {
      endPoint += '&limit=$limit';
    }

    if (breed.isNotEmpty) {
      endPoint += '&breed_ids=$breed';
    }

    print(endPoint);

    try {
      Response response = await dio.get(endPoint);

      if (response.statusCode! == 200) {
        return List<model.CatModel>.from(
            response.data.map((x) => model.CatModel.fromJson(x)));
      } else {
        throw ServerException();
      }
    } catch (e) {
      rethrow;
    }
  }
}
