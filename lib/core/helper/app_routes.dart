import 'package:clean_architecture_tdd/features/authentication/presentation/pages/content_screen.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/pages/sign_in_screen.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/pages/sign_up_screen.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import 'app_strings.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SPLASH_SCREEN_ROUTE:
      return MaterialPageRoute(
        builder: (BuildContext context) => const SplashScreen(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case SIGN_IN_SCREEN_ROUTE:
      return MaterialPageRoute(
        builder: (BuildContext context) => const SignInScreen(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    case SIGN_UP_SCREEN_ROUTE:
      return MaterialPageRoute(
        builder: (BuildContext context) => const SignUpScreen(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    // case SET_NAME_SCREEN_ROUTE:
    //   return MaterialPageRoute(
    //     builder: (BuildContext context) => const SetNameScreen(),
    //     settings: RouteSettings(
    //       name: settings.name,
    //       arguments: settings.arguments,
    //     ),
    //   );
    case CONTENT_SCREEN_ROUTE:
      return MaterialPageRoute(
        builder: (BuildContext context) => const ContentScreen(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
  }
}
