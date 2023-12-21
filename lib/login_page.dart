import 'dart:convert';
import 'homepage.dart';
import 'signup.dart'; // Import your SignupPage
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

// ... (Your existing imports)

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Add a GlobalKey for the form

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPass = false;

  Future<void> _login() async {
    final response = await http.post(
      Uri.parse('http://localhost/rica/login.php'),
      body: {
        'username': usernameController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      if (result['message'] == 'Login successful') {
        // Navigate to the next screen (Firstpage)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Firstpage()),
        );
      } else {
        // Handle login failure
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Incorrect username or password'),
          ),
        );
      }
    } else {
      // Handle errors
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text(
          'Login Page',
          style: TextStyle(color: Color.fromARGB(244, 255, 255, 255)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // Wrap the Form widget around your Column
          key: _formKey, // Set the key for the form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/rica.jpg'),
                height: 100,
                width: 180,
              ),
              TextFormField(
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'RobotoMono',
                ),
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                obscureText: false, // Set to false to show the entered text
              ),
              TextFormField(
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'RobotoMono',
                ),
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                        icon: Icon(!showPass
                            ? Icons.visibility
                            : Icons.visibility_off))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                obscureText: showPass,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(199, 141, 221, 1)),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Form is valid, perform login
                    _login();
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
              SizedBox(height: 10), // Add some spacing between buttons
              TextButton(
                onPressed: () {
                  // Navigate to the signup page (SignupPage)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 239, 173, 245),
    );
  }
}
