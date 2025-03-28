import 'package:flutter/material.dart';
import 'package:todo_app/components/colors.dart';
import '../model/todo_model.dart';

class TodoItem extends StatelessWidget {
  final ToDo toDo;
  final onToDoChanged;
  final onDeleteItem;

  const TodoItem({
    super.key,
    required this.toDo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
         onToDoChanged(toDo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          toDo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          toDo.todoText!,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: tdBlack,
            decoration: toDo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(),
          child: IconButton(
            onPressed: () {
             onDeleteItem(toDo.id);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
