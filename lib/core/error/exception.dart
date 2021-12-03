class NetworkException implements Exception {}

class UnknownException implements Exception {
  final String message;

  UnknownException(this.message);
}

class IncorrectPasswordException implements Exception {}