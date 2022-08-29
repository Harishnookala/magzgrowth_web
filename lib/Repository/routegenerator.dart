import 'package:flutter/cupertino.dart';
import 'package:magzgrowth_web/Repository/generatepageroute.dart';
import 'package:magzgrowth_web/Repository/routes.dart';

import 'package:magzgrowth_web/home.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.Homepage:
        return GeneratePageRoute(
            widget: Homepage(), routeName: settings.name);
      default:
        return GeneratePageRoute(
            widget: Homepage(), routeName: settings.name);
    }
  }
}