import 'package:flutter/material.dart';
import 'package:test1/presentation/home.dart';
import 'package:test1/presentation/login.dart';
import 'package:test1/presentation/pagination.dart';
import 'package:test1/utils/constants.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case paginationRoute:
        return MaterialPageRoute(builder: (_) => PaginationPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
