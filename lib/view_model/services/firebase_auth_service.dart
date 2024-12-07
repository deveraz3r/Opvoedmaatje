import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign Up method
  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      // Handle errors (e.g., weak password, invalid email)
      print('Sign Up Error: $e');
      return null;
    }
  }

  // Login method
  Future<User?> loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential.user);
      return userCredential.user;
    } catch (e) {
      // Handle errors (e.g., user not found, wrong password)
      print('Login Error: $e');
      return null;
    }
  }

  // Reset Password method
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print('Password reset email sent to $email');
    } catch (e) {
      // Handle errors (e.g., invalid email)
      print('Password Reset Error: $e');
    }
  }

  // Sign Out method
  Future<void> signOut() async {
    await _auth.signOut();
    print('User signed out');
  }

  // Get the current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Stream to listen for auth state changes (logged in / logged out)
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
