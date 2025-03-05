import 'package:flutter/material.dart';
import 'package:todo_app/components/colors.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          print('Tap to box');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          Icons.check_box,
          color: tdBlue,
        ),
        title: Text(
          'Check Email',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: tdBlack,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(),
          child: IconButton(
            onPressed: () {
              print('Clicked on delete button');
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
