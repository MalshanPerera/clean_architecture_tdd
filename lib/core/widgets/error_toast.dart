import 'package:another_flushbar/flushbar.dart';
import 'package:clean_architecture_tdd/core/error/exception.dart';
import 'package:clean_architecture_tdd/core/helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorToast {

  void showError(BuildContext context, String message, [VoidCallback? onRetry]) {
    final Flushbar _flushBar = Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      margin: EdgeInsets.symmetric(
        horizontal: 28.w,
        vertical: 34.h,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 14.w,
      ),
      borderRadius: BorderRadius.circular(6),
      boxShadows: [
        BoxShadow(
          color: Colors.grey.shade100,
          offset: const Offset(0.0, 3.0),
          blurRadius: 6.0,
        ),
      ],
      isDismissible: true,
      backgroundColor: PRIMARY_COLOR,
      // duration: exception.duration,
      mainButton: onRetry != null ? TextButton(
        onPressed: () {
          Navigator.pop(context);
          onRetry();
        },
        child: const Text(
          "Try Again",
          style: TextStyle(
            color: Color(0xFFFFA73B),
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ) : null,
      messageText: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding:  EdgeInsets.only(right: 6.0),
            child: Icon(
              Icons.error_outline_rounded,
              color: Colors.amberAccent,
            ),
          ),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );

    _flushBar.show(context);
  }
}