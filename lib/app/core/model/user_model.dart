import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  // final String? fullName;
  final String uid;
  final String country;
  final String email;
  final String phoneNumber;
  final Timestamp createdAt;

  UserModel ({
    required this.uid,
    required this. country,
    required this.email,
    required this.phoneNumber,
    required this.createdAt,
  });

  //map to fetch to firestore
  factory UserModel.fromMap(Map<String, dynamic> data, documentId) {
    return UserModel(
      uid: documentId,
      country: data['country'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      createdAt: data['createdAt'] ?? Timestamp.now()
    );
  }

  // to save to firestore
  Map<String, dynamic> toMap() {
    return {
      "country": country,
      "email": email,
      "phoneNumber": phoneNumber,
      "createdAt": createdAt
    };
  }
  
}