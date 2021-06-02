import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/auth_screen.dart';
import 'package:grocery_app/screens/bottom_bar.dart';

class AuthState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        //ignore: missing_return
        builder: (context, userSnapshot) {
      if (userSnapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (userSnapshot.connectionState == ConnectionState.active) {
        if (userSnapshot.hasData) {
          //The user is already logged in
          print('The user is already logged in');
         return BottomBarScreen();
        } else {
          //The user isn't logged in
          print('The user isn\'t logged in');
         return AuthScreen();
        }
      } else if (userSnapshot.hasError) {
        return Center(
          child: Text('Error occurred'),
        );
      }
    });
  }
}
