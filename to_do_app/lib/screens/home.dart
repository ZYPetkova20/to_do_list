import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/todo_idem.dart';
import '../model/todo.dart';

class Home extends StatefulWidget {
  Home ({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  final _todoController = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
            child: Column(
              children: [
                Expanded(
                  child:ListView(
                    children: [
                    Container(
                    margin: EdgeInsets.only(top: 50, bottom: 20),
                    child: Text(
                      'To Do:',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                    ),
                    for( ToDo toDo in todoList)
                      ToDoItem(
                        todo: toDo,
                        onToDoChanged: _handleToDoChange,
                        onDeleteItem: _deleteToDoItem,
                      ),
                ]
              ),
              )

              ]
              ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20, 
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical : 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const  [BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0,
                    ),] ,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Add a new to do item',
                      border: InputBorder.none,
                    ),
                  ), 
                ), 
              ),
               Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text('+', style: TextStyle(fontSize: 46,),),
                  onPressed: () {
                    _addToDoItem(_todoController.text);
                  }, 
                  style: ElevatedButton.styleFrom(
                    primary: todoBlue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  )
                  )
               ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
    
  }

  void _deleteToDoItem(String Id){
    setState(() {
      todoList.removeWhere((item) => item.id == Id);
    });
  }

  void _addToDoItem(String toDO){
    setState(() {
      todoList.add(ToDo(
      id: DateTime.now().millisecond.toString(), 
      todoText: toDO,
    ));
    });

    _todoController.clear();
  }
}