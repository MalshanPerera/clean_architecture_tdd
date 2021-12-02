import 'package:clean_architecture_tdd/core/error/failure.dart';
import 'package:clean_architecture_tdd/core/use_case/use_case.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/entities/user_results.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SignInUC implements UseCase<UserResults, SignInParams> {

  final AuthRepository repository;

  SignInUC({required this.repository});

  @override
  Future<Either<Failure, UserResults>> call(SignInParams params) {
    return repository.signIn(
      email: params.email,
      password: params.password,
    );
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}