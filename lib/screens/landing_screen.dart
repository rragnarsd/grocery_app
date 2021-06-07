import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  child: Text('Sign in'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/SignInForm');
                  }),
            ),
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  child: Text('Register'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/RegisterForm');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
