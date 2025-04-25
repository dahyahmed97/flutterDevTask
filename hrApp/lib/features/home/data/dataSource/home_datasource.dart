import 'package:flutterdevtask/features/home/data/models/meetings_model.dart';
import 'package:flutterdevtask/features/home/data/models/tasks_model.dart';

abstract class IHomeDatasource {
  Future<List<MeetingsModel>> getMeetings();

  Future<List<TasksModel>> getTasks();
}
