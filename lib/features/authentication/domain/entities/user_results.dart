import 'package:clean_architecture_tdd/features/authentication/data/models/user_model.dart';

class UserResults {
  final Data? data;
  final String? message;

  const UserResults({
    this.data,
    this.message,
  });
}
