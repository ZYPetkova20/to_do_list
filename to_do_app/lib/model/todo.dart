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
      ToDo(id: '01', todoText: 'Clean my room', ),
      ToDo(id: '02', todoText: 'Do my homework',),
      ToDo(id: '03', todoText: 'Walk the dog', isDone: true),
      ToDo(id: '04', todoText: 'Buy groceries', ),
    ];
  }
}