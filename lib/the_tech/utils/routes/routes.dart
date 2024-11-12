import 'package:flutter/material.dart';
import 'package:np/screen/home.dart';
import 'package:np/the_tech/utils/routes/routes_name.dart';
import 'package:np/the_tech/view/home_screent.dart';
import 'package:np/the_tech/view/login_screen.dart';
import 'package:np/the_tech/view/signup_screen.dart';
import 'package:np/the_tech/view/splash_screen.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeScreent());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text("No Routes defines"),
                  ),
                ));
    }
  }
}
