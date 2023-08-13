import 'package:amazon_clone_project/constants/global_variable.dart';
import 'package:amazon_clone_project/features/auth/screens/auth_screens.dart';
import 'package:amazon_clone_project/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariable.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariable.secondaryColor, 
        ),

        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData( color: Colors.black),
        )
      ),

      onGenerateRoute: Routegenerator.generateRoute,
      
      home: const AuthScreen(),
    );
  }
}
