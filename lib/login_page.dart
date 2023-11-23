import 'homepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
          backgroundColor: Color.fromARGB(244, 101, 214, 101),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('images/images.png'),
                  height: 100,
                  width: 100,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontFamily: 'RobotoMono',
                    color: Colors.white,
                  ),
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                        .hasMatch(value)) {
                      return 'Invalid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: const TextStyle(
                    fontFamily: 'RobotoMono',
                    color: Colors.white,
                  ),
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoMono',
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (_passwordController.text.length < 6) {
                      return 'Password Length should be more than 6 characters';
                    } else if (!RegExp(
                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&_])[A-Za-z\d@$!%*?&]+$')
                        .hasMatch(value)) {
                      return 'Password must meet the requirement';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 128, 57)),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      // Check for specific username and password
                      if (_usernameController.text == "Benedick@gmail.com" &&
                          _passwordController.text == "Fernandez@14") {
                        // Successful login
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Firstpage()),
                        );
                      } else {
                        // Incorrect username or password
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Incorrect username or password'),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 19, 114, 0));
  }
}
