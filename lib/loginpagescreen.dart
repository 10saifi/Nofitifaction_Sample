import 'package:flutter/material.dart';

import 'Homepagescreen.dart';



class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'PushNotification Sample',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _HomePageState();
}

class _HomePageState extends State<LoginPage> {
  // Define a key to access the form
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _password = '';


  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_password);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>  HomeApp(
            )),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        alignment: Alignment.center,
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 35),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Eamil
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email address';
                          }
                          // Check if the entered email has the right format
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          // Return null if the entered email is valid
                          return null;
                        },
                        onChanged: (value) => _userEmail = value,
                      ),

                      /// Password
                      TextFormField(
                        decoration:
                        const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 8) {
                            return 'Password must be at least 8 characters in length';
                          }
                          // Return null if the entered password is valid
                          return null;
                        },
                        onChanged: (value) => _password = value,
                      ),

                      const SizedBox(height: 20),
                      Container(
                          alignment: Alignment.centerRight,
                          child: OutlinedButton(
                              onPressed: _trySubmitForm,
                              child: const Text('Sign In')))
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}