// import 'dart:math';

import 'package:amazon_clone_project/common/widgets/custom_button.dart';
import 'package:amazon_clone_project/common/widgets/input_textfield.dart';
import 'package:amazon_clone_project/constants/global_variable.dart';
import 'package:amazon_clone_project/constants/utils.dart';
import 'package:amazon_clone_project/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
    signUp,
    signIn
}

class AuthScreen extends StatefulWidget {
  static const String routename = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}


class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp; //by default _auth is signUp

  final signupkey = GlobalKey<FormState>();
  final signinkey = GlobalKey<FormState>();
  final Authservices authservices = Authservices();

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  void dispose(){
    super.dispose();
    emailcontroller.dispose();
    namecontroller.dispose();
    passwordcontroller.dispose();
  }

  void signUpUser() {
    authservices.signUpUser(
      name: namecontroller.text,
      context: context,
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );
  }

  void signInUser() {
    authservices.signInUser(
      context: context,
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundCOlor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              ListTile(
                tileColor: (_auth == Auth.signUp)
                   ? GlobalVariable.backgroundColor
                   : GlobalVariable.greyBackgroundCOlor,
                
                title: const Text('Create Account'),
                leading: Radio(
                  activeColor: GlobalVariable.secondaryColor,
                  value: Auth.signUp,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signUp)
                Container(
                  color: GlobalVariable.backgroundColor,
                  padding: EdgeInsets.all(8),
                  child: Form(
                    key: signupkey,
                    child: Column(
                      children: [
                        customTextField(
                          controllers: emailcontroller,
                          hinttext: 'Email',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextField(
                          controllers: namecontroller,
                          hinttext: 'Name',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextField(
                          controllers: passwordcontroller,
                          hinttext: 'Password',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        customButton(
                          text: "signUp",
                          onTap: () {
                            if(signupkey.currentState!.validate())
                            {
                              signUpUser();
                              // showSnakbar(context, "SIGN-UP");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ListTile(
                title: Text('Sign-In.'),
                leading: Radio(
                  activeColor: GlobalVariable.secondaryColor,
                  value: Auth.signIn,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),

              if (_auth == Auth.signIn)
                Container(
                  color: GlobalVariable.backgroundColor,
                  padding: const EdgeInsets.all(8),
                  child: Form(
                    key: signinkey,
                    child: Column(
                      children: [
                        customTextField(
                          controllers: emailcontroller,
                          hinttext: 'Email',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextField(
                          controllers: passwordcontroller,
                          hinttext: 'Password',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        customButton(
                          text: "signIn",
                          onTap: () {
                            if(signinkey.currentState!.validate()){
                              signInUser();
                              // showSnakbar(context, "SIGN-IN");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
