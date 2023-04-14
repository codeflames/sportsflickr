import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHelper {
  static String getErrorMessage(FirebaseAuthException error) {
    switch (error.code) {
      // Email/password sign up errors
      case 'email-already-in-use':
        return 'This email address is already in use.';
      case 'weak-password':
        return 'Your password is too weak. Please choose a stronger password.';
      case 'invalid-email':
        return 'The email address you entered is invalid.';
      // Email/password sign in errors
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      // Phone sign up errors
      case 'invalid-phone-number':
        return 'The phone number you entered is invalid. Please enter a valid phone number.';
      case 'quota-exceeded':
        return 'Too many requests have been made to verify this phone number. Please try again later.';
      // Phone sign in errors
      case 'invalid-verification-code':
        return 'The verification code you entered is invalid. Please try again.';
      case 'invalid-verification-id':
        return 'The verification ID you entered is invalid. Please try again.';
      case 'session-expired':
        return 'Your verification session has expired. Please try again.';
      // Other errors
      case 'user-disabled':
        return 'This account has been disabled. Please contact support.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'requires-recent-login':
        return 'This action requires you to log in again.';
      default:
        print(error.code);
        print(error.stackTrace);
        return 'An unknown error occurred. Please try again later.';
    }
  }
}
