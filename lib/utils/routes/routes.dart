import 'package:opvoedmaatje/view/chat_screen.dart';
import 'package:opvoedmaatje/view/history_screen.dart';
import 'package:opvoedmaatje/view/notification_scren.dart';
import 'package:opvoedmaatje/utils/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opvoedmaatje/view/signin_screen.dart';
import 'package:opvoedmaatje/view/signup_screen.dart';
import '../../view/home_screen.dart';

class Routes {
  // static Route<dynamic> generateRoute(RouteSettings settings){
  //   switch(settings.name){
  //     case RouteName.homeScreen:
  //       return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
  //
  //     case RouteName.notificationScreen:
  //       return MaterialPageRoute(builder: (BuildContext context) => const NotificationScreen());
  //
  //     //add page routes here
  //
  //     default:
  //       return MaterialPageRoute(builder: (context){
  //         return const Scaffold(
  //           body: Center(
  //             child: Text("No route defined"),
  //           ),
  //         );
  //       });
  //   }
  // }

  //GetX
  static appRoutes() => [
    GetPage(name: RouteName.signUpScreen, page: () => SignUpPage()),
    GetPage(name: RouteName.signInScreen, page: () => SignInPage()),
    GetPage(name: RouteName.homeScreen, page: () => HomeScreen()),
    GetPage(name: RouteName.chatScreen, page: () => ChatScreen()),
    GetPage(name: RouteName.historyScreen, page: () => HistoryScreen()),
    GetPage(name: RouteName.notificationScreen, page: () => NotificationScreen()),
  ];

}