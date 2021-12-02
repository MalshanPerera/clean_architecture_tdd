import 'package:flutter/foundation.dart' show ChangeNotifier;

abstract class AuthModel extends ChangeNotifier {
  bool get isAuthenticated;

  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
}
