
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/app_repository_impl.dart';
import '../../data/model/user_data.dart';

class UsersPageController extends GetxController{
  final RxList<UserData> users = <UserData>[].obs;
  RxBool theme = false.obs;
  RxBool loading = false.obs;

  Rx<ThemeMode> currentTheme = ThemeMode.system.obs;

  // function to switch between themes
  void switchTheme() {
    currentTheme.value = currentTheme.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }
  void getBranches() async {
    loading.value = true;
    final result = await AppRepositoryImpl.getAllUsers();
    users.value = result;
    loading.value = false;
  }
}