import 'package:clean_architecture_tdd/features/authentication/presentation/notifiers/auth_model.dart';
import 'package:clean_architecture_tdd/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/helper/app_colors.dart';
import 'core/helper/app_routes.dart';
import 'core/helper/app_strings.dart';
import 'core/services/navigation_service.dart';
import 'injection_container.dart';

class Head extends StatefulWidget {
  const Head({Key? key}) : super(key: key);

  @override
  State<Head> createState() => _HeadState();
}

class _HeadState extends State<Head> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthModel>(
      create: (context) => sl<AuthModel>(),
      child: MaterialApp(
        title: FlavorConfig.instance!.values.appName,
        theme: ThemeData(
          primarySwatch: PRIMARY_COLOR,
          primaryColor: PRIMARY_COLOR,
        ),
        debugShowCheckedModeBanner: false,
        navigatorKey: sl<NavigationService>().navigatorKey,
        initialRoute: SPLASH_SCREEN_ROUTE,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
