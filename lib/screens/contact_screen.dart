import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/alert_dialogs.dart';

import '../constants.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _auth = FirebaseFirestore.instance;
  GlobalKey<FormState> _contactFormKey = GlobalKey<FormState>();

  final messageTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  String name;
  String email;
  String message;

  @override
  void dispose() {
    messageTextController.dispose();
    nameTextController.dispose();
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        child: Stack(alignment: Alignment.center,
            children: [
              RotatedBox(
                quarterTurns: 2,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/brooke-lark.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    /*colors: [Colors.indigo.withOpacity(0.4), Colors.indigoAccent.shade200],*/
                    colors: [Colors.white.withOpacity(0.0), Colors.grey.shade200],
                    stops: [0.0, 1.0],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                 /* height: 350,*/
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Form(
                          key: _contactFormKey,
                          child: Column(
                            children: [
                              Text(
                                'Contact Us',
                            style: kTextStyleLarge.copyWith(fontSize: 30.0, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: nameTextController,
                                onChanged: (value) {
                                  name = value;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  border: UnderlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Provide your name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                controller: emailTextController,
                                onChanged: (value) {
                                  email = value;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: UnderlineInputBorder(),
                                ),
                                validator: (value) {
                                  var regex = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                  if (!regex.hasMatch(value)) {
                                    return 'Provide a valid email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                controller: messageTextController,
                                onChanged: (value) {
                                  message = value;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Message',
                                  border: UnderlineInputBorder(),
                                ),
                                maxLength: 200,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Provide your message';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 42.0,
                          child: ElevatedButton(
                            child: Text(
                              'Send',
                              style:
                                  TextStyle(fontSize: 18.0, letterSpacing: 1.2),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.all(10.0),
                            ),
                            onPressed: () async {
                              try {
                                if (_contactFormKey.currentState.validate()) {
                                  await _auth.collection('contactform').add({
                                    'name': name,
                                    'email': email,
                                    'message': message
                                  });
                                  showAlertDialog(context,
                                      title: '',
                                      content: 'Your message has been delivered',
                                      defaultActionText: 'Ok',
                                  function: () => Navigator.pushNamed(context, '/BottomBarScreen'));
                                  messageTextController.clear();
                                  nameTextController.clear();
                                  emailTextController.clear();
                                }
                              }
                              catch (error) {
                                print('Error, $error');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
