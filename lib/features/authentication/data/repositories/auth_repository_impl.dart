import 'package:clean_architecture_tdd/core/error/failure.dart';
import 'package:clean_architecture_tdd/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/entities/user_results.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

/// Typedef in Dart is used to create a user-defined identity (alias) for a function,
/// and we can use that identity in place of the function in the program code.
/// When we use typedef we can define the parameters of the function.
/// Syntax: typedef function_name ( parameters );
typedef _SignInOrSignUp = Future<UserResults> Function();

class AuthRepositoryImpl implements AuthRepository {
  late final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, UserResults>> signIn({
    required String email,
    required String password,
  }) async {
    return await _authenticate(() {
      return remoteDataSource.signIn(
        email: email,
        password: password,
      );
    });
  }

  @override
  Future<Either<Failure, UserResults>> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    return await _authenticate(() {
      return remoteDataSource.signUp(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
    });
  }

  Future<Either<Failure, UserResults>> _authenticate(_SignInOrSignUp getSignInOrSignUp) async {
    try {
      final remoteTrivia = await getSignInOrSignUp();
      return Right(remoteTrivia);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
