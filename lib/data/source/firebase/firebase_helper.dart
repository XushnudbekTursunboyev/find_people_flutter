

import 'package:find_people_flutter/data/model/user_data.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseHelper {
  static DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child('users');

  static Future<void> addUser(UserData userData) async {
    await databaseReference.push().set({
      'name': userData.name,
      'lat': userData.lat,
      'lang': userData.long,
    });
  }

  // static Future<List<UserData>> fetchUserDataFromDatabase() async {
  //   List<UserData> userList = [];
  //
  //   DataSnapshot dataSnapshot = await databaseReference.once();
  //
  //   dataSnapshot.value.forEach((key, value) {
  //     userList.add(UserData.fromSnapshot(DataSnapshot(key, value)));
  //   });
  //
  //   return userList;
  // }

}