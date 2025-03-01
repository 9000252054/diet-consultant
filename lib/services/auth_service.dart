import 'package:firebase_auth/firebase_auth.dart';
import 'firestore_service.dart'; // Import Firestore Service

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService(); // Firestore instance

  // Register with Email & Password
  Future<User?> registerUser(String email, String password,String name) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );


      User? user = userCredential.user;
      if (user != null) {
        await _firestoreService.addUser(user.uid, name, email); // Save user to Firestore
      }

      return userCredential.user;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  // Login with Email & Password
  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential.user;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  // Logout User
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Password Reset
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
