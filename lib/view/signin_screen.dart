import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:opvoedmaatje/resources/components/reusable_app_bar.dart';
import 'package:opvoedmaatje/resources/components/reusable_elevated_button.dart';
import 'package:opvoedmaatje/utils/routes/route_name.dart';
import '../view_model/services/firebase_auth_service.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  final FirebaseAuthService _authService = FirebaseAuthService();

  // Sign in function
  Future<void> _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    Get.offNamed(RouteName.homeScreen);//TODO: remove this

    if (email.isEmpty || password.isEmpty) {
      // Show error if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter email and password')));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Call Firebase login method
    User? user = await _authService.loginWithEmailPassword(email, password);

    setState(() {
      _isLoading = false;
    });

    if (user != null) {
      // Navigate to the Home page after successful login
      Get.offNamed(RouteName.homeScreen);
    } else {
      // Show error if login failed
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(titleText: ('Sign In')),
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
              onPressed: _signIn,
              buttonName: ('Sign In'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to Sign Up page if user doesn't have an account
                Get.offNamed(RouteName.signUpScreen);
              },
              child: Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
