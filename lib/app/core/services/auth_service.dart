import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:realize_mobile_app/app/core/model/user_model.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign up
  Future<void> signupUser({
    required String country,
    required String email,
    required String phoneNumber,
    required String password,
    required BuildContext context,
  }) async {
    try {

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user?.uid ?? '';

      if (uid.isEmpty) {
        throw Exception("Failed to generate UID for user");
      }

      UserModel newUser = UserModel(
        uid: uid,
        country: country,
        email: email,
        phoneNumber: phoneNumber,
        createdAt: Timestamp.now(),
      );

      // save to firestore
      await _firestore.collection('users').doc(uid).set(newUser.toMap());

      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
    } catch (e) {}
  }







}
