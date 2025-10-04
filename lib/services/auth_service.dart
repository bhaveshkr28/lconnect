import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Sign up with email + password
  Future<User?> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    required String rollNo,
  }) async {
    UserCredential userCred =
    await _auth.createUserWithEmailAndPassword(email: email, password: password);

    User? user = userCred.user;

    await _db.collection("users").doc(user!.uid).set({
      "name": name,
      "email": email,
      "rollNo": rollNo,
      "createdAt": FieldValue.serverTimestamp(),
    });

    return user;
  }

  /// Login with email + password
  Future<User?> loginWithEmail(String email, String password) async {
    try {
      UserCredential userCred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCred.user != null) {
        return userCred.user;
      } else {
        // This is a specific error if the Firebase call succeeded but the user object is null
        throw Exception("Login failed: User credential is null.");
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Login failed";
    } catch (e) {
      // Catch any other exceptions
      throw "An unexpected error occurred during login.";
    }
  }


  /// Sign in with Google
/*
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCred = await _auth.signInWithCredential(credential);
    User? user = userCred.user;

    // If new user, save profile
    final doc = await _db.collection("users").doc(user!.uid).get();
    if (!doc.exists) {
      await _db.collection("users").doc(user.uid).set({
        "name": user.displayName,
        "email": user.email,
        "rollNo": null,
        "createdAt": FieldValue.serverTimestamp(),
      });
    }

    return user;
  }
*/

  /// Logout
  Future<void> signOut() async {
    await _auth.signOut();
    //await GoogleSignIn().signOut();
  }
}
