import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String passwordErrorText = '';
  String usernameErrorText = '';

  Future<void> _signup() async {
    // Perform password validation
    if (!_validatePassword(passwordController.text)) {
      setState(() {
        passwordErrorText =
            'Password must contain capital letters, numbers, special characters, and be at least 8 characters long.';
      });
      return;
    } else {
      setState(() {
        passwordErrorText = '';
      });
    }

    // Perform username validation
    if (!_validateUsername(usernameController.text)) {
      setState(() {
        usernameErrorText = 'Username must end with "@gmail.com"';
      });
      return;
    } else {
      setState(() {
        usernameErrorText = '';
      });
    }

    // Proceed with signup
    final response = await http.post(
      Uri.parse('http://localhost/rica/signup.php'),
      body: {
        'username': usernameController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      // Display a message to the user based on the response from the server
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message']),
        ),
      );
    } else {
      // Handle errors
      print('Error: ${response.statusCode}');
    }
  }

  // Password validation function
  bool _validatePassword(String password) {
    // Add your password validation logic here
    // For example, requiring capital letters, numbers, special characters, and a minimum length of 8
    RegExp passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    // return passwordRegExp.hasMatch(password);
    return true;
  }

  // Username validation function
  bool _validateUsername(String username) {
    // Add your username validation logic here
    // For example, requiring the username to end with "@gmail.com"
    return username.endsWith('@gmail.com');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text(
          'Sign Up',
          style: TextStyle(color: Color.fromARGB(230, 197, 114, 223)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create new user',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: 'RobotoMono',
              ),
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle:
                    TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                errorText: usernameErrorText,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            TextFormField(
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: 'RobotoMono',
              ),
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle:
                    TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                errorText: passwordErrorText,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 82, 82, 82)),
              onPressed: () {
                // Perform signup when the button is pressed
                _signup();
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Color.fromARGB(255, 206, 129, 202),
                  fontFamily: 'RobotoMono',
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 203, 144, 218),
    );
  }
}
