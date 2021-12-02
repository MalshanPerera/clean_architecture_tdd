import 'package:clean_architecture_tdd/core/helper/app_config.dart';
import 'package:clean_architecture_tdd/core/helper/app_enum.dart';
import 'package:clean_architecture_tdd/core/services/network_service.dart';
import 'package:clean_architecture_tdd/features/authentication/data/models/user_model.dart';
import 'package:flutter/foundation.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<UserModel> signUp({
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
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    var response = await networkService.performRequest(
      AppConfig.authentication,
      HttpAction.POST,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      return compute(userFromJson, response.body);
    } else {
      return UserModel(message: response.body);
    }
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
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

    if (response.statusCode == 200) {
      return compute(userFromJson, response.body);
    } else {
      return UserModel(message: response.body);
    }
  }
}
