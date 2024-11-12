import 'package:flutter/material.dart';
import 'package:np/screen/home.dart';
import 'package:np/the_tech/data/app_exception.dart';
import 'package:np/the_tech/data/network/network_api_services.dart';
import 'package:np/the_tech/utils/routes/routes.dart';
import 'package:np/the_tech/utils/routes/routes_name.dart';
import 'package:np/the_tech/view_model/auth_view_model.dart';
import 'package:np/the_tech/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'screen/todo_list.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthViewModel()),
      ChangeNotifierProvider(create: (context) => UserViewModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Calling',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true).copyWith(),
      // home: HomeScreen(),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
