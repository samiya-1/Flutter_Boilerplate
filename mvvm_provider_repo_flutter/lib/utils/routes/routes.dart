import 'package:flutter/material.dart';
import 'package:mvvm_provider_repo_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_provider_repo_flutter/view/home_screen.dart';
import 'package:mvvm_provider_repo_flutter/view/login_view.dart';
import 'package:mvvm_provider_repo_flutter/view/signup_view.dart';
import 'package:mvvm_provider_repo_flutter/view/spalsh_view.dart';

class Routes {
  static Route<dynamic>  generateRoute(RouteSettings settings) {
    //final argument=settings.arguments;
    switch (settings.name) {
      
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        );

        case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginView(),
        );
        case RoutesName.signup:
        return MaterialPageRoute(
          builder: (BuildContext context) => SignupView(),
        );

        case RoutesName.splashScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => SpalshView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_ ) {
            return Scaffold(body: Center(child: Text("No route defined")));
          },
        );
    }
  }
}
