
class TodoModel {
  final String title;
  final DateTime time;
  bool isDone; 

  TodoModel({
    required this.title,
    required this.time,
    this.isDone = false,
  });

  TodoModel copyWith({
    String? title,
    DateTime? time,
    bool? isDone,
  }) {
    return TodoModel(
      title: title ?? this.title, 
      time: time ?? this.time,
      isDone: isDone?? this.isDone,
      );
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'],
      time: json['time'],
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'time': time,
      'isDone': isDone,
    };
  }

}