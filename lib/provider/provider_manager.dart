import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:stateManagmentRiverpod/model/todo.dart';
import 'package:uuid/uuid.dart';

class ProviderManager extends StateNotifier<List<Todo>> {
  ProviderManager([List<Todo>? initial]) : super(initial ?? []);

  void addTodo(String description) {
    debugPrint('Add item worked');
    final todo = Todo(id: const Uuid().v4(), description: description);
    state = [...state, todo];
  }

  void toggle(String id) {
    debugPrint('Toogle item worked');

    state = [
      for (Todo todo in state)
        if (todo.id == id)
          Todo(
              id: todo.id,
              description: todo.description,
              isCompleted: !todo.isCompleted)
        else
          todo
    ];
  }

  void editTodo(String id, String newDescription) {
    state = [
      for (Todo todo in state)
        if (todo.id == id)
          Todo(
              id: todo.id,
              description: newDescription,
              isCompleted: todo.isCompleted)
        else
          todo
    ];
  }

  void remove(Todo todo) {
    debugPrint('Remove item worked');
    state = state.where((element) => element.id != todo.id).toList();
  }
}
