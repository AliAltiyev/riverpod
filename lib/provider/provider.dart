import 'package:riverpod/riverpod.dart';
import 'package:stateManagmentRiverpod/provider/provider_manager.dart';
import 'package:uuid/uuid.dart';

import '../model/todo.dart';

final toDoListProvider = StateNotifierProvider<ProviderManager, List<Todo>>(
    (ref) => ProviderManager([
          Todo(id: const Uuid().v4(), description: 'Go To Gym'),
          Todo(id: const Uuid().v4(), description: 'School'),
          Todo(id: const Uuid().v4(), description: 'Shopping Time'),
          Todo(id: const Uuid().v4(), description: 'Udemy Time'),
        ]));
