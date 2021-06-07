import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/brooke-lark.jpg'),
              fit: BoxFit.cover,
            ),
            ),
          ),
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.0),
                  Colors.grey.shade200
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                      /*Container(
                child: Image.asset('assets/images/logo.png'),
              ),*/
                Container(
                  width: double.infinity,
                  height: 42.0,
                  child: ElevatedButton(
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 18.0, color: Colors.indigo, letterSpacing: 1.2),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: Colors.white.withOpacity(0.9),
                        padding: EdgeInsets.all(10.0),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/SignInForm');
                        print('hello');
                      }),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: double.infinity,
                  height: 42.0,
                  child: ElevatedButton(
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 18.0, letterSpacing: 1.2),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.all(10.0),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/RegisterForm');
                      }),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
