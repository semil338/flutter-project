import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sign_up_app/services/UIAuth.dart';

class Settingp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User _user = _auth.currentUser;
    final _profile = _user.photoURL != null
        ? _user.photoURL
        : 'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png';
    final _userName = _user.displayName != null ? _user.displayName : "none";
    return Scaffold(
      // backgroundColor: Colors.lightBlue,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            // crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(_profile),
                radius: 50,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Baloo2",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(_user.email,
              style:TextStyle(
                fontSize: 15,
                  fontFamily: "Baloo2",
              ),
              ),
              SizedBox(
                height: 10,
              ),
              // Text(_user.uid),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  
                  getSignOutUI(context);
                },
                child: Text(
                  "SignOut",
                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*class Listview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              color: Colors.brown[300],
              height: 100.0,
              child: Row(
                children: [
                  Text("CCD",
                      style: TextStyle(fontSize: 40.2, color: Colors.black)),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}*/
