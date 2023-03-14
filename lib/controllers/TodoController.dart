import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_todo_app/models/Todo.dart';
import 'package:get_storage/get_storage.dart';

class TodoController extends GetxController{
  var todos = <Todo>[].obs;

  @override
  void onInit(){
    List? storedTodos = GetStorage().read<List>('todos');

    if (storedTodos != null) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
      //todos = RxList(storedTodos.map((e) => Todo.fromJson(e)).toList());
    }
    ever(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });
    super .onInit();
  }
}