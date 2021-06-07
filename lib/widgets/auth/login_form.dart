import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery_app/widgets/alert_dialogs.dart';

import '../../constants.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _auth = FirebaseAuth.instance;
  GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;
  String url = '';
  final String header;
  final String subHeader;
  final String key;
  final String btnText;
  final Function function;

  _SignInFormState(
      {this.header, this.subHeader, this.key, this.btnText, this.function});

  String validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return "Please enter a password";
    } else if (value.length < 6) {
      return "Password should be at least 6 characters";
    } else if (value.length > 12) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

  void _submit() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await _auth.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } catch (error) {
      showAlertDialog(context,
          title: 'Signed in failed',
          content: error.message,
          defaultActionText: 'Ok');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    //Condition that will be true if the user has successfully completed the sign in process
    if (googleUser != null) {
      //Access the access token
      final googleAuth = await googleUser.authentication;
      /*if (googleAuth.accessToken != null && googleAuth.idToken != null) {*/
      if (googleAuth.idToken != null) {
        //Get the user credentials
        final authResult = await _auth.signInWithCredential(
          GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken, idToken: googleAuth.idToken),
        );
        return authResult.user;
      } else {
        throw FirebaseAuthException(
            code: 'Error missing Google ID token',
            message: 'Missing Google ID Token');
      }
    } else {
      throw FirebaseAuthException(
          code: 'Error aborted by user', message: 'Sign in aborted by user');
    }
  }

  Future<void> _signInWithFacebook() async {
    final fb = FacebookLogin();
    final response = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email
    ]);
    switch (response.status) {
      case FacebookLoginStatus.success:
        final accessToken = response.accessToken;
        final userCredential = await _auth.signInWithCredential(
          FacebookAuthProvider.credential(accessToken.token),
        );
        return userCredential.user;
      case FacebookLoginStatus.cancel:
        throw FirebaseAuthException(
            code: 'Error aborted by user', message: 'Sign in aborted by user');
      case FacebookLoginStatus.error:
        throw FirebaseAuthException(
          code: 'Error Facebook login failed',
          message: response.error.developerMessage,
        );
      default:
        throw UnimplementedError();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back!',
                    style: kTextStyleLarge.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign in to your account',
                    style: kTextStyleMedium.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Form(
                key: _signInFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: kInputDecoration.copyWith(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: validateEmail,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: kInputDecoration.copyWith(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: validatePassword,
                      obscureText: _obscureText,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _isLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.indigo),
                          )
                        : Container(
                            width: double.infinity,
                            height: 40.0,
                            child: ElevatedButton(
                              child: Text(
                                'Sign in',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: EdgeInsets.all(10.0),
                              ),
                              onPressed: _submit,
                            ),
                          ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2.0,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 2.0,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            child: Text('Facebook'),
                            onPressed: _signInWithFacebook,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              primary: Color(0xFF334D92),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            child: Text('Google'),
                            onPressed: _signInWithGoogle,
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                primary: Color(0xFFDB4437)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
