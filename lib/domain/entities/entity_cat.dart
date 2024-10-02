import 'package:catbreeds/domain/entities/entity_breed.dart';
import 'package:equatable/equatable.dart';

class CatEntity extends Equatable {
  final String? id;
  final String? url;
  final List<BreedEntity>? breeds;

  const CatEntity({this.id, this.url, this.breeds});

  @override
  List<Object?> get props => [];
}
