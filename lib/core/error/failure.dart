import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  const Failure({required this.errorMessage, List properties = const <dynamic>[]}) :super();

  @override
  List<Object?> get props => [];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure() : super(errorMessage: "Server Error!");
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super(errorMessage: "No network connection. Please try again!");
}

class FormatFailure extends Failure {
  const FormatFailure() : super(errorMessage: "Bad Request");
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super(errorMessage: "Request timed out. Please try again!");
}

class HttpException extends Failure {
  final String message;
  const HttpException({required this.message}) : super(errorMessage: message);

}