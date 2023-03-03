import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_todo_app/models/Todo.dart';

class TodoController extends GetxController{
  var todos = <Todo>[].obs;
}