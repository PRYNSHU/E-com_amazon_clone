import 'package:amazon_clone_project/features/auth/screens/auth_screens.dart';
import 'package:amazon_clone_project/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
class Routegenerator{
static Route<dynamic> generateRoute(RouteSettings routeSettings){

  switch(routeSettings.name){

     case AuthScreen.routename:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

      case homeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const homeScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(child: Text("cases not working"))
        ),
      );
  }

}
}