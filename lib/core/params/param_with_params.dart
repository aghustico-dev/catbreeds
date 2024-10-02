import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final int? limit;
  final String? breed;
  final int? page;

  const Params({this.limit, this.breed, this.page});

  @override
  List<Object> get props => [];
}
