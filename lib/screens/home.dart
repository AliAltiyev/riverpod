import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../model/todo.dart';
import '../widgets/title.dart';
import '../widgets/todo_list_item.dart';
import '../widgets/tooltip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textController = TextEditingController();
  List<Todo> todos = [
    Todo(id: const Uuid().v4(), description: 'Sport'),
    Todo(id: const Uuid().v4(), description: 'Yoga'),
    Todo(id: const Uuid().v4(), description: 'Learning Time'),
    Todo(id: const Uuid().v4(), description: 'School')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          const CustomTitle(),
          TextField(
            decoration: const InputDecoration(labelText: 'Add task'),
            controller: _textController,
            onSubmitted: (value) {
              //TODO do not forget
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(child: Text('4 todos')),
              CustomTooltip(message: 'All Todos', buttonText: 'All'),
              CustomTooltip(
                  message: 'Completed Todos', buttonText: 'Completed'),
              CustomTooltip(
                  message: 'Uncompleted Todos', buttonText: 'Uncompleted'),
            ],
          ),
          for (int i = 0; i < todos.length; i++)
            Dismissible(
                key: UniqueKey(),
                onDismissed: (_) {},
                child: TodoListItem(todo: todos[i]))
        ],
      ),
    );
  }
}
