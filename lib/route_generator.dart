import 'package:flutter/material.dart';
import './main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case '/second':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => SecondPage(
                  data: args,
                ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      case '/third':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => ThirdPage(
                  data: args,
                ),
          );
        }
        return _errorRoute();
      case '/fourth':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => FourthPage(
                  data: args,
                ),
          );
        }
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /fifth
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}