import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;
      if (user != null) {
        await _saveUserData(user); 
      }
      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  /// تسجيل مستخدم جديد
  Future<User?> signUp(String email, String password, String firstname, String phonenumber, String lastname) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;
      if (user != null) {
        await _saveUserData(user, isNewUser: true, firstname: firstname, phonenumber: phonenumber, lastname: lastname);
      }
      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  /// حفظ بيانات المستخدم في Firestore
  Future<void> _saveUserData(User user, {bool isNewUser = false, String firstname = '', String phonenumber = '', String lastname = ''}) async {
    final userDoc = _firestore.collection('users').doc(user.uid);

    if (isNewUser) {
      await userDoc.set({
        'uid': user.uid,
        'email': user.email,
        'createdAt': FieldValue.serverTimestamp(),
        'firstname': firstname.isNotEmpty ? firstname : 'No Name',
        'lastname': lastname.isNotEmpty ? lastname : 'No Name',
        'phonenumber': phonenumber.isNotEmpty ? phonenumber : 'No Phone',
        'usercart': [],
      });
    } else {
      await userDoc.set({
        'uid': user.uid,
        'email': user.email,
        'lastLogin': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    }
  }

  /// إعادة تعيين كلمة المرور
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }
}