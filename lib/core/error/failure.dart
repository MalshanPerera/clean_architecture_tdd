import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class NetworkFailure extends Failure {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'No Internet Connection, please check your connection';
}

class HttpFailure extends Failure {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Oops! Something went wrong';
}


class UnknownFailure extends Failure {
  final String? message;

  UnknownFailure([this.message]);

  @override
  List<Object> get props => [];

  @override
  String toString() => message ?? 'Unknown Failure';
}

class IncorrectPasswordFailure extends Failure {
  @override
  List<Object> get props => [];
}