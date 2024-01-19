

import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:find_people_flutter/ui/page/maps_page.dart';
import 'package:find_people_flutter/ui/page/users_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../data/model/user_data.dart';

class UsersScreen extends StatelessWidget {
  final List<UserData> users;

  const UsersScreen(this.users, {super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UsersPageController>();
    controller.getBranches(users);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        automaticallyImplyLeading: false,
        title: Text('Active users', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.map_rounded, size: 24,)),

          IconButton(onPressed: (){

          }, icon: Icon(Icons.more_vert_rounded, size: 24,))
        ],
      ),
      body: Container(

        child: Flexible(
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(right: 16, left: 16, top: 5),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFD3B96A)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 8,),
                      Text('${users[index].name}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      Spacer(),
                      IconButton(onPressed: (){
                        // Get.off(() => MapsScreen(users));
                        List<UserData> list = [UserData(id: users[index].id, name: users[index].name, lat: users[index].lat, long: users[index].long)];

                        Get.to(MapsScreen(list));
                      }, icon: Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey,))
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
