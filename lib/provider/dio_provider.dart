import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stateManagmentRiverpod/model/todo_api.model.dart';
import 'package:stateManagmentRiverpod/provider/provider.dart';

final todoFutureProvider = FutureProvider<List<Todoapimodel>>((ref) async {
  final _dio = ref.watch(httpProvider);
  final result = await _dio.get('todos');
  List<Map<String, dynamic>> _dataList = result.data;
  List<Todoapimodel> _todos =
      _dataList.map((element) => Todoapimodel.fromMap(element)).toList();

  debugPrint(_todos.toString());
  return _todos;
});
