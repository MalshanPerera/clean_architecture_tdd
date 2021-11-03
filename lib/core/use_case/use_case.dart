import 'package:clean_architecture_tdd/core/error/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}