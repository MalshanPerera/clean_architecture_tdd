import 'package:clean_architecture_tdd/core/error/failure.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/entities/user_results.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserResults>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserResults>> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
}
