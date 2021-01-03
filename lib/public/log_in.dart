import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sign_up_app/private/home.dart';
import 'package:sign_up_app/public/create_account.dart';
import 'package:sign_up_app/public/landing.dart';
import 'package:sign_up_app/services/auth.dart';
import 'package:twinkle_button/twinkle_button.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.brown[50],
        body: Container(
            child: Column(children: <Widget>[
          // 1.logo
          Expanded(
              child: Container(
            child: logo1(),
          )),

          //2.Login details
          Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //for some space
                      SizedBox(
                        height: 20,
                      ),

                      //Login to Continue Text
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Login to Continue",
                          style: TextStyle(
                              fontFamily: "Baloo2",
                              fontSize: 28.0,
                              color: Colors.brown),
                        ),
                      ),

                      //textfield fuction
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                child: Icon(
                                  Icons.email,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                  child: TextField(
                                controller: emailController,
                                style: TextStyle(fontSize: 18),
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(15),
                                    hintText: "Email",
                                    hintStyle: TextStyle(fontFamily: "Baloo2")),
                              ))
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                child: Icon(
                                  Icons.vpn_key,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                  child: TextField(
                                controller: passwordController,
                                style: TextStyle(fontSize: 18),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(15),
                                    hintText: "Password",
                                    hintStyle: TextStyle(fontFamily: "Baloo2")),
                              ))
                            ],
                          )),
                      //textfield fuction

                      //for some space
                      SizedBox(
                        height: 81,
                      ),

                      //Login Button
                      Row(children: <Widget>[
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: TwinkleButton(
                            onclickButtonFunction: () async {
                              String msg = await context
                                  .read<AuthenticationService>()
                                  .signIn(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim());
                              if (msg == "Signed in") {
                                print("e");
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        duration: Duration(milliseconds: 1000),
                                        reverseDuration:
                                            Duration(milliseconds: 800),
                                        child: Home()));
                              }
                            },
                            buttonWidth: 300,
                            durationTime: null,
                            buttonTitle: Text(
                              "Log In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Baloo2"),
                            ),
                            buttonColor: Colors.brown[500],
                          ),
                        ))
                      ]),

                      //Create Account Button
                      Row(children: <Widget>[
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: TwinkleButton(
                              // twinkleTime: 1,
                              highlightColor: Colors.brown[100],
                              buttonWidth: 300,
                              durationTime: null,
                              buttonTitle: Text(
                                "Create Account",
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 20.0,
                                    fontFamily: "Baloo2"),
                              ),
                              buttonColor: Colors.white,
                              onclickButtonFunction: () {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        duration: Duration(milliseconds: 800),
                                        reverseDuration:
                                            Duration(milliseconds: 800),
                                        child: CreateAccount()));
                              }),
                        ))
                      ])
                    ],
                  ),
                ),
              )),
        ])));
  }
}
