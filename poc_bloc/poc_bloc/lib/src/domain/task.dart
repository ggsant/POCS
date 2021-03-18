class Task {
  int id;
  String task;
  Task({
    this.id,
    this.task,
  });

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    task = json['task'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['task'] = this.task;

    return data;
  }
}
