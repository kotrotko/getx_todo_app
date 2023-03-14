import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_todo_app/controllers/TodoController.dart';
import 'package:getx_todo_app/models/Todo.dart';
import 'package:getx_todo_app/screens/TodoScreen.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Todo list"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoScreen()); // here is a temporary solution
        },
      ),
      body: Container(
        child: Obx(
            () => ListView.separated(
              itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                onDismissed: (_){
                  Todo? removed = todoController.todos[index];
                  todoController.todos.removeAt(index);
                  Get.snackbar('Task removed',
                    'The task ${removed.text} was succesfully removed.',
                    mainButton: TextButton(
                      onPressed: () {
                        if (removed == null) {
                          return;
                        }
                        todoController.todos.insert(index, removed!);
                        removed = null;
                        if(Get.isSnackbarOpen) {
                          Get.back();
                        }
                      },
                      child: Text("Undo", style: TextStyle(color: Colors.red),)
                  ),);
                },
                child: ListTile(
                  title: Text(
                    todoController.todos[index].text,
                    style: (todoController.todos[index].done)
                      ?  TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough
                      )
                      :  TextStyle(
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                  ),
                  onTap: (){
                    Get.to(
                      TodoScreen(index: index,)
                    );
                  },
                  leading: Checkbox(
                    value: todoController.todos[index].done,
                    onChanged: (v){
                      var changed = todoController.todos[index];
                      changed.done = v!;
                      todoController.todos[index] = changed;
                    },
                  ),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              separatorBuilder: (_, __) => Divider(),
              itemCount: todoController.todos.length,
            )
        ),
      ),
    );
  }
}
