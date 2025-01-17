import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sign_up_app/private/home.dart';
import 'package:sign_up_app/public/landing.dart';
import 'package:sign_up_app/services/auth.dart';
import 'package:provider/provider.dart';

Future<dynamic> getSignInUI(
  BuildContext context,
  String _email,
  String _password,
) async {
  dynamic status = await context.read<AuthenticationService>().signIn(
        email: _email,
        password: _password,
      );
  if (status == true) {
    return Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        duration: Duration(milliseconds: 1000),
        reverseDuration: Duration(milliseconds: 800),
        child: Home(),
      ),
    );
  } else {
    if (status == "Given String is empty or null") {
      final snackBar = SnackBar(
        content: Text("Email or Password cannot be Empty"),
        backgroundColor: Colors.brown,
      );
      return ScaffoldMessenger.maybeOf(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        content: Text("Invalid Email or Password"),
        backgroundColor: Colors.brown,
      );
      return ScaffoldMessenger.maybeOf(context).showSnackBar(snackBar);
    }
  }
}

Future<dynamic> getSignUpUI(
  BuildContext context,
  String _username,
  String _email,
  String _password,
) async {
  dynamic status = await context.read<AuthenticationService>().signUp(
        email: _email,
        password: _password,
        uName: _username,
      );
  if (_username == "" && _email == "" && _password == "") {
    final snackBar = SnackBar(
      content: Text("All Fields are Required"),
      backgroundColor: Colors.brown,
    );
    return ScaffoldMessenger.maybeOf(context).showSnackBar(snackBar);
  } else if (_username == "") {
    final snackBar = SnackBar(
      content: Text("Username Required"),
      backgroundColor: Colors.brown,
    );
    return ScaffoldMessenger.maybeOf(context).showSnackBar(snackBar);
  } else if (status == true) {
    return Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        duration: Duration(milliseconds: 1000),
        reverseDuration: Duration(milliseconds: 800),
        child: Home(),
      ),
    );
  } else {
    if (status == "Given String is empty or null") {
      final snackBar = SnackBar(
        content: Text("Email or Password cannot be Empty"),
        backgroundColor: Colors.brown,
      );
      return ScaffoldMessenger.maybeOf(context).showSnackBar(snackBar);
    } else if (status ==
        "The email address is already in use by another account.") {
      final snackBar = SnackBar(
        content: Text(status),
        backgroundColor: Colors.brown,
      );
      return ScaffoldMessenger.maybeOf(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        content: Text("Invalid Email or Password"),
        backgroundColor: Colors.brown,
      );
      return ScaffoldMessenger.maybeOf(context).showSnackBar(snackBar);
    }
  }
}

Future<dynamic> getGoogleSignUI(
  BuildContext context,
) async {
  dynamic status =
      await context.read<AuthenticationService>().signInWithGoogle();
  if (status == true) {
    return Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        duration: Duration(milliseconds: 1000),
        reverseDuration: Duration(milliseconds: 800),
        child: Home(),
      ),
    );
  } else {
    final snackBar = SnackBar(
      content: Text(status),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Future<dynamic> getSignOutUI(BuildContext context) async {
  dynamic status = await context.read<AuthenticationService>().signOut();
  if (status == true) {
    return Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        duration: Duration(milliseconds: 800),
        reverseDuration: Duration(milliseconds: 800),
        child: Landing(),
      ),
    );
  } else {
    return ScaffoldMessenger.maybeOf(context).showSnackBar(
      (SnackBar(content: Text(status))),
    );
  }
}
