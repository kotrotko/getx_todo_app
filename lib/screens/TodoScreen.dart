import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/TodoController.dart';
import '../models/Todo.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();
  final int? index;

  TodoScreen({this.index}); //index of the item you're editing
  // if you just are adding a new item, the index will be null.

  @override
  Widget build(BuildContext context) {
    String text = '';
    //if(this.index! >= 0 && this.index! < todoController.todos.length){ //Here is a problem
    if(this.index != null){
      text = todoController.todos[index!].text;
    }
    TextEditingController textEditingController = TextEditingController(
      text: text,
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
                      //if (todoController.todos.isEmpty || index == null) {
                      if (this.index == null) {
                        todoController.todos.add(
                          Todo(text: textEditingController.text));
                      }else{
                        var editing = todoController.todos[index!];
                        editing.text = textEditingController.text;
                        todoController.todos[index!] = editing;
                        //todoController.todos[index!].text = textEditingController.text;
                      }
                      //textEditingController.clear();
                      Get.back();},

                    //child: Text((todoController.todos.isEmpty || index == null) ? 'Add' : 'Edit'),
                    child: Text((this.index == null) ? 'Add' : 'Edit'),
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
