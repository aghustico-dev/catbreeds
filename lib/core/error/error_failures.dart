import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Failure extends Equatable {
  final String? code;
  final String? message;

  const Failure({@required this.code, @required this.message});

  @override
  List<Object?> get props => [code, message];
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class DioFailure extends Failure {}
