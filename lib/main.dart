import 'package:firebase_core/firebase_core.dart';
import 'package:opvoedmaatje/view/home_screen.dart';
import 'package:opvoedmaatje/view/notification_scren.dart';
import 'package:opvoedmaatje/utils/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'view_model/services/firebase_service.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override`
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        RouteName.notificationScreen: (context) => const NotificationScreen()
      },
    );
  }
}
