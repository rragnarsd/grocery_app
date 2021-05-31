import 'package:flutter/material.dart';
import 'package:toggle_bar/toggle_bar.dart';

import 'auth/login_form.dart';
import 'auth/register_form.dart';

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 80,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      if (_selectedIndex == 0)
                        SignInForm()
                      else if (_selectedIndex == 1)
                        RegisterForm()
                    ],
                  ),
                ),
              ],
            ),
            ToggleBar(
              borderRadius: 10.0,
              labels: ['Sign in', 'Register'],
              textColor: Colors.white,
              backgroundColor: Colors.indigo,
              selectedTabColor: Colors.indigoAccent,
              onSelectionUpdated: (index) {
                setState(() {
                  if (_selectedIndex == 0)
                    SignInForm();
                  else if (_selectedIndex == 1)
                    RegisterForm();
                  _selectedIndex = index;
                });
              },
            ),
          ],
        );
  }
}



