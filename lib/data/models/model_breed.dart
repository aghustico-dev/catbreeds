import 'package:catbreeds/domain/entities/entity_breed.dart';

class BreedModel extends BreedEntity {
  const BreedModel(
      {super.id,
      super.name,
      super.origin,
      super.countryCodes,
      super.countryCode,
      super.description,
      super.lifeSpan,
      super.indoor,
      super.lap,
      super.adaptability,
      super.affectionLevel,
      super.childFriendly,
      super.catFriendly,
      super.dogFriendly,
      super.energyLevel,
      super.grooming,
      super.healthIssues,
      super.intelligence});

  factory BreedModel.fromJson(Map<String, dynamic> json) => BreedModel(
        id: json['id'],
        name: json['name'],
        origin: json['origin'],
        countryCodes: json['country_codes'],
        countryCode: json['country_code'].toString(),
        description: json['description'],
        lifeSpan: json['life_span'],
        indoor: json['indoor'],
        lap: json['lap'],
        adaptability: json['adaptability'],
        affectionLevel: json['affection_level'],
        childFriendly: json['child_friendly'],
        catFriendly: json['cat_friendly'] ?? 0,
        dogFriendly: json['dog_friendly'],
        energyLevel: json['energy_level'],
        grooming: json['grooming'],
        healthIssues: json['health_issues'],
        intelligence: json['intelligence'],
      );
}
