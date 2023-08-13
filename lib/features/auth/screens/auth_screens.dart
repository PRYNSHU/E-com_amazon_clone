import 'package:amazon_clone_project/common/widgets/custom_button.dart';
import 'package:amazon_clone_project/common/widgets/input_textfield.dart';
import 'package:amazon_clone_project/constants/global_variable.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const String routename = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

enum Auth{
  signUp, 
  signIn
}

class _AuthScreenState extends State<AuthScreen> {

  Auth _auth = Auth.signUp; //by default _auth is signUp

  final signupkey = GlobalKey<FormState>();
  final signinkey = GlobalKey<FormState>();

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundCOlor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),

              ListTile(
                tileColor: _auth == Auth.signUp
                ? GlobalVariable.backgroundColor
                : GlobalVariable.greyBackgroundCOlor,

                title: const Text('Create Account'),
                leading: Radio(
                  activeColor: GlobalVariable.secondaryColor,
                  value: Auth.signUp,
                  groupValue: _auth,
                  onChanged: (Auth){
                    setState(() {
                      _auth = Auth!;
                    });
                  },
                ),
              ),

              if(_auth == Auth.signUp)
                Container(
                  color: GlobalVariable.backgroundColor,
                  padding: EdgeInsets.all(8),
                  child: Form(
                    key: signupkey,
                    child: Column(
                      children: [
                        customTextField(controllers: emailcontroller,
                        hinttext: 'Email',),
                        const SizedBox(height: 10,),
                
                        customTextField(controllers: namecontroller,
                        hinttext: 'Name',),
                        const SizedBox(height: 10,),
                        
                        customTextField(controllers: passwordcontroller,
                        hinttext: 'Password',),
                        const SizedBox(height: 10,),
                
                         customButton(text: "signUp", onTap: (){

                         },),
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
                  onChanged: (Auth){
                    setState(() {
                      _auth = Auth!;
                    });
                  },
                ),
              ),

              if(_auth == Auth.signIn)
                Container(
                  color: GlobalVariable.backgroundColor,
                  padding: EdgeInsets.all(8),
                  child: Form(
                    key: signupkey,
                    child: Column(
                      children: [
                        customTextField(controllers: emailcontroller,
                        hinttext: 'Email',),
                        const SizedBox(height: 10,),
                        
                        customTextField(controllers: passwordcontroller,
                        hinttext: 'Password',),
                        const SizedBox(height: 10,),
                
                         customButton(text: "signIn", onTap: (){
                          
                         },),
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
