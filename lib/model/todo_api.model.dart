import 'dart:convert';

class Todoapimodel {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  Todoapimodel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  Todoapimodel copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return Todoapimodel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory Todoapimodel.fromMap(Map<String, dynamic> map) {
    return Todoapimodel(
      userId: map['userId'].toInt() as int,
      id: map['id'].toInt() as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todoapimodel.fromJson(String source) =>
      Todoapimodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Todoapimodel(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(covariant Todoapimodel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;
  }
}
