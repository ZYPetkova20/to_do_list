class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: '1', ),
      ToDo(id: '02', todoText: '2', isDone: true),
      ToDo(id: '03', todoText: '3', isDone: true),
      ToDo(id: '04', todoText: '4', ),
      ToDo(id: '05', todoText: '5', ),
      ToDo(id: '06', todoText: '6', ),
    ];
  }
}