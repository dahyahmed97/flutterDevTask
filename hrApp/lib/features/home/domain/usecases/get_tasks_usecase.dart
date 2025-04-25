import 'package:dartz/dartz.dart';
import 'package:flutterdevtask/core/base/base_use_case.dart';
import 'package:flutterdevtask/core/error/failures.dart';
import 'package:flutterdevtask/features/home/data/models/tasks_model.dart';
import 'package:flutterdevtask/features/home/domain/repos/home_repo.dart';

class GetTasksUsecase extends BaseUseCase<List<TasksModel>, NoParams> {
  final IHomeRepo homeRepo;

  GetTasksUsecase(this.homeRepo);

  @override
  Future<Either<Failure, List<TasksModel>>> execute(NoParams params) async {
    return homeRepo.getTasks();
  }
}
