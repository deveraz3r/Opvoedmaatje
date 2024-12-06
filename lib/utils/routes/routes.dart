import 'package:opvoedmaatje/view/notification_scren.dart';
import 'package:opvoedmaatje/utils/routes/route_name.dart';
import 'package:flutter/material.dart';

import '../../view/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());

      case RouteName.notificationScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const NotificationScreen());

      //add page routes here

      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}