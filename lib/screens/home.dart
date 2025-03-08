import 'package:flutter/material.dart';
import 'package:todo_app/components/colors.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          'All ToDos',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todoo in todosList)
                        TodoItem(
                          toDo: todoo,
                          onToDoChanged: _handleTodoChanged,
                          onDeleteItem: _deleteTodoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 30),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        foregroundColor: Colors.white,
                        elevation: 5,
                        minimumSize: Size(60, 60)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleTodoChanged(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      foregroundColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage('assets/images/260.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
      // centerTitle: true,
    );
  }
}

Widget searchBox() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: tdBlack,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          maxWidth: 20,
        ),
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(color: tdGrey),
      ),
    ),
  );
}
