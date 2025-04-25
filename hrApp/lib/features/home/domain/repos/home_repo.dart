import 'package:dartz/dartz.dart';
import 'package:flutterdevtask/core/error/failures.dart';
import 'package:flutterdevtask/features/home/data/models/meetings_model.dart';
import 'package:flutterdevtask/features/home/data/models/tasks_model.dart';

abstract class IHomeRepo {
  Future<Either<Failure, List<MeetingsModel>>> getMeetings();

  Future<Either<Failure, List<TasksModel>>> getTasks();
}
