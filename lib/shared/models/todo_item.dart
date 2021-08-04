class ToDoItem {
  ToDoItem({
    required this.title,
    this.isDone = false,
  });

  final String title;
  final bool isDone;

  ToDoItem copyWith({
    String? title,
    bool? isDone,
  }) {
    return ToDoItem(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ToDoItem && other.title == title && other.isDone == isDone;
  }

  @override
  int get hashCode => title.hashCode ^ isDone.hashCode;
}
