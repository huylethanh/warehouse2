import 'package:flutter/material.dart';
import 'package:warehouse_app/screens/index.dart';

class AppNavigation {
  static final navKey = GlobalKey<NavigatorState>();

  static void pushNamed<T>(String name, {Object? arguments}) {
    navKey.currentState!.pushNamed<T>(name, arguments: arguments);
  }

  static Future<void> pushReplacementNamed<T extends Object>(String name,
      {Object? arguments}) {
    return navKey.currentState!
        .pushReplacementNamed(name, arguments: arguments);
  }
}

class Routing {
  static const String login = '/login';
  static const String home = '/home';

  static Route<dynamic> onManagerGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routing.login:
        final reason = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return LoginScreen(
              loginReason: reason,
            );
          },
        );

      case Routing.home:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const HomeScreen();
          },
        );

      default:
        throw new Exception("Not support ");
    }
  }
}
