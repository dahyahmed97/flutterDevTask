import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutterdevtask/core/error/failures.dart';
import 'package:flutterdevtask/core/http/network_config/network_info.dart';
import 'package:flutterdevtask/core/repository/base_repository.dart';
import 'package:flutterdevtask/features/home/data/dataSource/home_datasource.dart';
import 'package:flutterdevtask/features/home/data/models/meetings_model.dart';
import 'package:flutterdevtask/features/home/data/models/tasks_model.dart';
import 'package:flutterdevtask/features/home/domain/repos/home_repo.dart';

class HomeRepo extends BaseRepository implements IHomeRepo {
  final IHomeDatasource homeDatasource;

  HomeRepo(this.homeDatasource)
    : super(NetworkInfo(con: DataConnectionChecker()));
  @override
  Future<Either<Failure, List<MeetingsModel>>> getMeetings() async {
    return await handleException(() => homeDatasource.getMeetings());
  }

  @override
  Future<Either<Failure, List<TasksModel>>> getTasks() async {
    return await handleException(() => homeDatasource.getTasks());
  }
}
