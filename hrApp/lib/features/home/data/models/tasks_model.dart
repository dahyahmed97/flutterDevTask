import 'package:flutter/material.dart';
import 'package:flutterdevtask/features/home/data/models/tasks_enums.dart';

class TasksModel {
  int? id;
  String? title;
  String? endDate;
  int? priority;
  List<String>? comments;
  int? status;
  int? numOfAssignees;
  double? progress;

  TasksModel({
    this.id,
    this.title,
    this.endDate,
    this.priority,
    this.comments,
    this.status,
    this.numOfAssignees,
    this.progress,
  });

  /// Map API int to TaskPriority enum using `level`
  TaskPriority? get taskPriority {
    if (priority == null) return null;
    return TaskPriority.values.firstWhere(
      (e) => e.level == priority,
      orElse: () => TaskPriority.low,
    );
  }

  /// Map API int to TaskStatus enum using `value`
  TaskStatus? get taskStatus {
    if (status == null) return null;
    return TaskStatus.values.firstWhere(
      (e) => e.value == status,
      orElse: () => TaskStatus.todo,
    );
  }

  String? get priorityLabel => taskPriority?.label;
  int? get priorityLevel => taskPriority?.level;
  String? get statusLabel => taskStatus?.label;
  Color? get priorityColor => taskPriority?.color;

  TasksModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    endDate = json['endDate'];
    priority = json['priority'];
    comments = json['comments'].cast<String>();
    status = json['status'];
    numOfAssignees = json['numOfAssignees'];
    progress = json['progress']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['endDate'] = endDate;
    data['priority'] = priority;
    data['comments'] = comments;
    data['status'] = status;
    data['numOfAssignees'] = numOfAssignees;
    data['progress'] = progress;

    return data;
  }
}
