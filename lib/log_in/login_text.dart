import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoolin/utils/dimesions.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LogInTextFields(),
  ));
}

class LogInTextFields extends StatelessWidget {
  final formGlobalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isEmailValid = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: Dimensions.height10 * 0.8),
              ElevatedButton(
                onPressed: () {
                  // Perform Google login logic here
                  _loginWithGoogle();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/image/google_logo.png', // Replace with your own Google logo asset
                      height: 24.0,
                      width: 24.0,
                    ),
                    SizedBox(width: 8.0),
                    Text('Login with Google'),
                  ],
                ),
              ),

              const SizedBox(height: 16.0),
              const Text(
                'OR',
                style: TextStyle(fontSize: 20),
              ),

              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _isEmailValid ? null : 'Invalid email address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!EmailValidator.validate(value)) {
                    _isEmailValid = false;
                    return 'Invalid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: Dimensions.height15),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Validation successful, proceed with signup
                    String name = _nameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    // Perform login logic here
                    // ...

                    // Clear the form fields
                    _nameController.clear();
                    _emailController.clear();
                    _passwordController.clear();
                  }
                },
                child: Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      // Perform Google login logic here
      // ...
    } catch (e) {
      print('Google login failed: $e');
    }
  }
}
