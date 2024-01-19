import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_people_flutter/data/model/user_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class AppRepositoryImpl {
  static final CollectionReference location = FirebaseFirestore.instance.collection('location');

  static Future<void> addUser(UserData contactData) async {
    try {
      if (contactData.id.isEmpty) {
        contactData.id = location.doc().id;
      }

      await location.doc(contactData.id).set(contactData.toJson());
    } catch (e) {}
  }

  static Future<void> update(UserData contactData) async {
    try {
      if (contactData.id.isEmpty) {
        contactData.id = location.doc().id;
      }

      await location.doc(contactData.id).set(contactData.toJson());
    } catch (e) {}
  }

  static Future<List<UserData>> getAllUsers() async {
      List<UserData> list = [];
      QuerySnapshot snapshot = await location.get();
      print('2 ishladi  ${snapshot}');
      list = snapshot.docs.map((doc) {
        return UserData.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      return list;
  }

}
