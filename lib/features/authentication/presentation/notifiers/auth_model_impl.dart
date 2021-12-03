import 'package:clean_architecture_tdd/core/error/exception.dart';
import 'package:clean_architecture_tdd/core/helper/app_strings.dart' show CONTENT_SCREEN_ROUTE;
import 'package:clean_architecture_tdd/core/services/error_service.dart';
import 'package:clean_architecture_tdd/core/services/navigation_service.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/use_cases/sign_in_uc.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/use_cases/sign_up_uc.dart';

import 'auth_model.dart';

class AuthModelImpl extends AuthModel {
  late final SignInUC signInUC;
  late final SignUpUC signUpUC;
  late final ErrorService errorService;
  late final NavigationService navigationService;

  AuthModelImpl({
    required this.signInUC,
    required this.signUpUC,
    required this.errorService,
    required this.navigationService,
  });

  @override
  Future<void> signIn({required String email, required String password}) {
    return signInUC(SignInParams(email: email, password: password)).then(
      (v) => v.fold(
        (l) => errorService.showError(l),
        (r) => navigationService.pushReplacement(CONTENT_SCREEN_ROUTE),
      ),
    );
  }

  @override
  bool get isAuthenticated => throw UnimplementedError();

  @override
  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) {
    return signUpUC(
      SignUpParams(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      ),
    ).then(
      (v) => v.fold(
        (l) => print("Error"),
        (r) => print("Done"),
      ),
    );
  }
}
