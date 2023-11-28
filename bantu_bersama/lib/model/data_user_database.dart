import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(
    String email,
    String firstName,
    String lastName,
    String username,
    // String profileImageUrl,
  ) async {
    return await userCollection.doc(uid).set({
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      // 'profileImageUrl': profileImageUrl,
    });
  }
}