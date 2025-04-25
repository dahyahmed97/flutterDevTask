import 'package:flutter/material.dart' show Color, Colors;

enum TaskPriority { low, medium, high }

enum TaskStatus { todo, inProgress, done, blocked }

extension TaskPriorityExtension on TaskPriority {
  String get label {
    switch (this) {
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.medium:
        return 'Medium';
      case TaskPriority.high:
        return 'High';
    }
  }

  int get level {
    switch (this) {
      case TaskPriority.low:
        return 1;
      case TaskPriority.medium:
        return 2;
      case TaskPriority.high:
        return 3;
    }
  }

  Color get color {
    switch (this) {
      case TaskPriority.low:
        return Colors.green;
      case TaskPriority.medium:
        return Colors.orangeAccent;
      case TaskPriority.high:
        return Colors.red.shade500;
    }
  }
}

extension TaskStatusExtension on TaskStatus {
  int get value {
    switch (this) {
      case TaskStatus.todo:
        return 1;
      case TaskStatus.inProgress:
        return 2;
      case TaskStatus.done:
        return 3;
      case TaskStatus.blocked:
        return 4;
    }
  }

  String get label {
    switch (this) {
      case TaskStatus.todo:
        return 'To Do';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.done:
        return 'Done';
      case TaskStatus.blocked:
        return 'Blocked';
    }
  }
}
