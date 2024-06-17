import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'app_routing.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      final auth = FirebaseAuth.instance;
      auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      String email = emailController.text;
      String password = passwordController.text;
      print('Email: $email, Password: $password');
      Navigator.pushReplacementNamed(context, home);
    }
  }

  Future<void> signUp() async {
    if (_formKey.currentState!.validate()) {
      final auth = FirebaseAuth.instance;
      auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      String email = emailController.text;
      String password = passwordController.text;
      print('Email: $email, Password: $password');
      Navigator.pushReplacementNamed(context, home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: register,
                  child: Text('Register'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: signUp,
                  child: Text('SignUp'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
