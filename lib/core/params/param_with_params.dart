import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final String? id;
  final String? token;
  final Map<String, dynamic>? body;

  const Params({this.id, this.token, this.body});

  @override
  List<Object> get props => [id!];
}
