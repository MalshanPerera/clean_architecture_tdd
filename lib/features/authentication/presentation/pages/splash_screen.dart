import 'package:clean_architecture_tdd/core/helper/app_enum.dart';
import 'package:clean_architecture_tdd/core/helper/app_strings.dart' show SIGN_IN_SCREEN_ROUTE;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, SIGN_IN_SCREEN_ROUTE);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: getSize(),
      orientation: Orientation.portrait,
    );

    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }

  // Get the size according to the device type
  Size getSize() {
    if (MediaQuery.of(context).size.width > 400) {
      return DeviceType.MOBILE.size;
    } else {
      return DeviceType.TABLET.size;
    }
  }
}
