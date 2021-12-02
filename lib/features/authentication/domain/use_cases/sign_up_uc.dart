import 'package:clean_architecture_tdd/core/error/failure.dart';
import 'package:clean_architecture_tdd/core/use_case/use_case.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/entities/user_results.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SignUpUC implements UseCase<UserResults, SignUpParams> {
  final AuthRepository repository;

  SignUpUC({required this.repository});

  @override
  Future<Either<Failure, UserResults>> call(SignUpParams params) async {
    return repository.signUp(
      email: params.email,
      password: params.password,
      firstName: params.firstName,
      lastName: params.lastName,
    );
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const SignUpParams({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object?> get props => [email, password, firstName, lastName];
}
