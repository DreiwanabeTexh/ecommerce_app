import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  Future addUserDetails(Map<String, dynamic> userInfo, String uid) async {
    return await FirebaseFirestore.instance
    .collection("users")
    .doc(uid)
    .set(userInfo);
  }
}