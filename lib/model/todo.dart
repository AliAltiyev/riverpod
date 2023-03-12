class Todo {
  String id;
  String description;
  bool isCompleted;

  Todo({required this.id, required this.description, this.isCompleted = false});

  @override
  String toString() {
    return 'Todo{id: $id, description: $description, isCompleted: $isCompleted}';
  }
}
