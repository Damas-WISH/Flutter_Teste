import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Registra usuário com email/senha e cria doc em `users/{uid}` com extraData.
  Future<UserCredential> registerWithEmail(
    String email,
    String password,
    Map<String, dynamic> extraData,
  ) async {
    final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final uid = cred.user?.uid;
    if (uid != null) {
      final data = <String, dynamic>{
        'email': email,
        ...extraData,
        'createdAt': FieldValue.serverTimestamp(),
      };
      await _db.collection('users').doc(uid).set(data);
    }
    return cred;
  }

  Future<void> updateUserData(String uid, Map<String, dynamic> data) =>
      _db.collection('users').doc(uid).update(data);

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String uid) =>
      _db.collection('users').doc(uid).get();

  Future<void> deleteUser(String uid) => _db.collection('users').doc(uid).delete();
}
