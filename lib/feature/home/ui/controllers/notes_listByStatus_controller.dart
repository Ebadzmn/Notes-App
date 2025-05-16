
import 'package:notesapp/feature/home/models/task_model.dart';

class TaskListByStatus {
  String? status;
  List<TaskModel>? TaskList;

  TaskListByStatus({this.status, this.TaskList});

  TaskListByStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      TaskList = <TaskModel>[];
      json['data'].forEach((v) {
        TaskList!.add(TaskModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.TaskList != null) {
      data['data'] = this.TaskList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
