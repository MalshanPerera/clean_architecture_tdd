import 'dart:async';
import 'dart:developer';

import 'package:clean_architecture_tdd/core/error/exception.dart';
import 'package:clean_architecture_tdd/core/error/failure.dart';
import 'package:clean_architecture_tdd/core/services/navigation_service.dart';
import 'package:clean_architecture_tdd/core/widgets/error_toast.dart';
import 'package:flutter/foundation.dart';

class ErrorService {

  final NavigationService navigationService;

  const ErrorService(this.navigationService);

  void showError(Failure failure, [VoidCallback? onRetry]) {
    final context = navigationService.navigatorKey.currentState!.overlay!.context;
    final ErrorToast handler = ErrorToast();
    handler.showError(context, failure.toString(), onRetry);
  }
}
