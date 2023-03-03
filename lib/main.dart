import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/screens/TodoScreen.dart';
import 'package:getx_todo_app/screens/HomeScreen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
