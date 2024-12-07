import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opvoedmaatje/resources/components/reusable_app_bar.dart';
import 'package:opvoedmaatje/resources/components/reusable_elevated_button.dart';
import '../utils/routes/route_name.dart';
import '../view_model/services/firebase_auth_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  final FirebaseAuthService _authService = FirebaseAuthService();

  // Sign up function
  Future<void> _signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      // Show error if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter email and password')));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Call Firebase sign-up method
    User? user = await _authService.signUpWithEmailPassword(email, password);

    setState(() {
      _isLoading = false;
    });

    if (user != null) {
      // Navigate to the Home page after successful sign-up
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Show error if sign-up failed
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign-up failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(titleText: ('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ReuseableElevatedbutton(
              onPressed: _signUp,
              buttonName: ('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to Sign In page if user already has an account
                Get.offNamed(RouteName.signInScreen);
              },
              child: Text('Already have an account? Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
