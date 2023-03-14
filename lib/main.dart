import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/screens/TodoScreen.dart';
import 'package:getx_todo_app/screens/HomeScreen.dart';
import 'package:get_storage/get_storage.dart';

//void main() async {
void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
