import 'dart:convert';

import 'package:amazon_clone_project/constants/error_handling.dart';
import 'package:amazon_clone_project/constants/global_variable.dart';
import 'package:amazon_clone_project/constants/utils.dart';
import 'package:amazon_clone_project/features/auth/screens/auth_screens.dart';
import 'package:amazon_clone_project/features/home/screens/home_screen.dart';
import 'package:amazon_clone_project/model/user.dart';
import 'package:amazon_clone_project/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authservices {
  //sign up user
  void signUpUser(
      {required String name,
      required BuildContext context,
      required String email,
      required String password}) async {
    //function body
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        token: '',
        type: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/auth/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; chatset=UTF-8',
        },
      );
      // print(res.body);

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
        },
      );
    } catch (e) {
      showSnakbar(context, 'not working sorry');
    }
  }

  //sign In user
  void signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    //function body
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/auth/api/signin'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{  
          'Content-Type': 'application/json;chatset=UTF-8',
        },
      );
      print('everyting is working');
      // print(res.body);

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          context: context,
          response: res,
          onSuccess: () async {
          // showSnakbar(context, 'Account created with , login with it!');

            SharedPreferences pref = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await pref.setString('x-auth-token', jsonDecode(res.body)['token']);

          // ignore: use_build_context_synchronously
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const homeScreen()),
              (Route<dynamic> route) => false,
          );
        },
      );
    } catch (e) {
      print('sorry error in signin//');
      showSnakbar(context, 'not SIGNIN working sorry');
    }
  }
}
