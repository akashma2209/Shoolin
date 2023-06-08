import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utils/colors.dart';
import '../verification/verify_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignInTextFields(),
  ));
}

class SignInTextFields extends StatelessWidget {
  final formGlobalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isEmailValid = true;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        Get.snackbar("Invalid!", " 'Enter a valid email'", backgroundColor: AppColors.mainColor, colorText: Colors.white,);
        // Successfully signed in with Google, proceed with signup
        String firstName = googleUser.displayName!.split(" ")[0];
        String lastName = googleUser.displayName!.split(" ")[1];
        String email = googleUser.email;
        // You can use the retrieved information for your signup logic
        //Get.to(() => VerifyScreen());
        // Clear the form fields
        _firstnameController.clear();
        _lastnameController.clear();
        _emailController.clear();
        _passwordController.clear();

      } else {
        // Google sign-in was canceled by the user
        Get.snackbar("Invalid!", " 'Enter a valid email'", backgroundColor: AppColors.mainColor, colorText: Colors.white,);
        print('Google sign-in was canceled.');
      }
    }
    catch (error) {
      // Error occurred during Google sign-in
      print('Error signing in with Google: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _signInWithGoogle,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/image/google_logo.png',
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text('Sign in with Google'),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'OR',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 50),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _firstnameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _lastnameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
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
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
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
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Validation successful, proceed with signup
                        String firstName = _firstnameController.text;
                        String lastName = _lastnameController.text;
                        String email = _emailController.text;
                        String password = _passwordController.text;

                        // Perform signup logic here

                        // Clear the form fields
                        _firstnameController.clear();
                        _lastnameController.clear();
                        _emailController.clear();
                        _passwordController.clear();
                      } else {
                        Get.to(() => VerifyScreen());
                      }
                    },
                    child: const Text('Signup'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
