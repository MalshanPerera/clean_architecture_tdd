import 'dart:async';
import 'dart:developer';

import 'package:clean_architecture_tdd/core/error/exception.dart';

class ErrorService {

  final StreamController<GeneralException> _streamController = StreamController<GeneralException>();

  Stream<GeneralException> get getErrorText => _streamController.stream;

  void setError(GeneralException error) async {
    _streamController.add(error);
    log("SET ERROR MESSAGE: ${error.message.toString()}");
  }

  void dispose() => _streamController.close();
}
