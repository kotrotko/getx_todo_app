import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:getx_todo_app/controllers/TodoController.dart';
import '../models/Todo.dart';

class TodoScreen extends StatelessWidget {
  //const TodoScreen({Key? key}) : super(key: key);
  final TodoController todoController = Get.find();
  final int index;

  TodoScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    String text = '';
    if(this.index != null){ //Here is a problem
      text = todoController.todos[index].text;
    }
    TextEditingController textEditingController = TextEditingController(
      text: text
    );
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'What do you want to accomplish?',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 25.0,
              ),
              keyboardType: TextInputType.multiline,
                maxLines: 999,
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Get.back();
                  },
                  child: Text('Cancel'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  )
                ),
                ElevatedButton(
                    onPressed: (){
                      todoController.todos.add(
                        Todo(text: textEditingController.text)
                      );
                      Get.back();
                    },
                    child: Text('Add'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    )
                ),
                //ElevatedButton(onPressed: onPressed, child: child),
              ],
            ),
          ],
        ),
      )
    );
  }
}
