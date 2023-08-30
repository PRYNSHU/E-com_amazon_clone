import 'package:amazon_clone_project/constants/error_handling.dart';
import 'package:amazon_clone_project/constants/global_variable.dart';
import 'package:amazon_clone_project/constants/utils.dart';
import 'package:amazon_clone_project/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Authservices {
  //sign up user
  void signUpUser(
  {
    required String name,
    required BuildContext context,
    required String email,
    required String password
    }) async {
    //function body
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email : email,
        address: '',
        token: '',
        type: '',
      );

      http.Response res =  await http.post(
        Uri.parse('$uri/auth/api/signup'),
        body: user.toJson(),
        headers: <String ,String>{
          'Content-Type' : 'application/json; chatset=UTF-8',
        },
      );
      
      httpErrorHandle(response: res,
       context: context,
        onSuccess: (){
          showSnakbar(context, 'Account Created! login with same credentials');
      },
      );
    } catch (e) {
      showSnakbar(context, e.toString());
    }
  }
}
