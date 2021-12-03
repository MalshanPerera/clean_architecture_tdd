import 'dart:convert';

import 'package:clean_architecture_tdd/core/error/error_model.dart';
import 'package:clean_architecture_tdd/core/error/exception.dart';
import 'package:clean_architecture_tdd/core/error/failure.dart';
import 'package:clean_architecture_tdd/core/helper/app_config.dart';
import 'package:clean_architecture_tdd/core/helper/app_enum.dart';
import 'package:clean_architecture_tdd/core/services/network_service.dart';
import 'package:clean_architecture_tdd/features/authentication/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  late final NetworkService networkService;

  AuthRemoteDataSourceImpl({required this.networkService});

  @override
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var response = await networkService.performRequest(
        AppConfig.authentication,
        HttpAction.POST,
        body: {
          "email": email,
          "password": password,
        },
      );
      return response.fold(
        (failure) => Left(failure),
        (data) => data.statusCode == 200
            ? Right(UserModel.fromJson(json.decode(data.body)))
            : Left(UnknownFailure(
                ErrorModel.fromJson(json.decode(data.body)).message)),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    try {
      var response = await networkService.performRequest(
        AppConfig.authentication,
        HttpAction.PUT,
        body: {
          "email": email,
          "password": password,
          "firstName": firstName,
          "lastName": lastName,
        },
      );
      return response.fold(
        (failure) => Left(failure),
        (data) => data.statusCode == 200
            ? Right(
                UserModel.fromJson(
                  json.decode(data.body),
                ),
              )
            : Left(
                UnknownFailure(
                    ErrorModel.fromJson(json.decode(data.body)).message),
              ),
      );
    } catch (e) {
      rethrow;
    }
  }

// @override
// Future<UserModel> signUp({
//   required String email,
//   required String password,
//   required String firstName,
//   required String lastName,
// }) async {
//   var response = await networkService.performRequest(
//     AppConfig.authentication,
//     HttpAction.PUT,
//     body: {
//       "email": email,
//       "password": password,
//       "firstName": firstName,
//       "lastName": lastName,
//     },
//   );
//
//   // if (response.statusCode == 200) {
//   //   return compute(userFromJson, response.body);
//   // } else {
//   //   return UserModel(message: response.body);
//   // }
// }
}
