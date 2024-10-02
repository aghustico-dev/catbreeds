import 'package:catbreeds/data/models/model_breed.dart';
import 'package:catbreeds/domain/entities/entity_cat.dart';
import 'package:catbreeds/utils/functions/func_common.dart' as utils;

class CatModel extends CatEntity {
  const CatModel({super.id, super.url, super.breeds});

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
        id: json['id'],
        url: json['url'] ?? '',
        breeds: utils.isNullOrEmpty(json['breeds'])
            ? []
            : List<BreedModel>.from(
                json['breeds'].map((x) => BreedModel.fromJson(x))),
      );
}
