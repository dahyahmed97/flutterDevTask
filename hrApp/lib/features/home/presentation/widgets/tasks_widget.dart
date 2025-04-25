import 'package:flutter/widgets.dart';
import 'package:flutterdevtask/features/home/data/models/tasks_model.dart';
import 'package:flutterdevtask/features/home/presentation/widgets/list_container_widget.dart';
import 'package:flutterdevtask/features/home/presentation/widgets/tasks_list_item.dart';

class TasksWidget extends StatelessWidget {
  final List<TasksModel> tasks;
  const TasksWidget({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListContainerWidget(
      title: "Today's Tasks",
      description: "the tasks assigned for you today.",
      count: tasks.length.toString(),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return TasksListItem(task: tasks[index]);
        },
        itemCount: tasks.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
