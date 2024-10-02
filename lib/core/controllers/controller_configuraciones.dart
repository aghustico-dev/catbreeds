import 'package:flutter/material.dart';

import 'package:catbreeds/domain/entities/entity_cat.dart' as domain;
import 'package:catbreeds/core/core.dart' as core;
import 'package:catbreeds/utils/functions/func_common.dart' as utils;

deviceIsTablet(BuildContext context) {
  return MediaQuery.of(context).size.shortestSide >= 600;
}

Future<List<domain.CatEntity>> obtenerCats(BuildContext context, int page,
    {int limit = 10, String breed = ''}) async {
  core.CatsService service = core.CatsService();

  return await service.getCats(limit, breed, page).then((result) {
    if (utils.isNullOrEmpty(result)) {
      return [];
    } else {
      return result.response;
    }
  });
}
