import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutterdevtask/core/error/failures.dart';
import 'package:flutterdevtask/core/http/network_config/network_info.dart';
import 'package:flutterdevtask/core/repository/base_repository.dart';
import 'package:flutterdevtask/features/clockIn/data/datasource/clock_in_datasource.dart';
import 'package:flutterdevtask/features/clockIn/data/models/clock_in_request_model.dart';
import 'package:flutterdevtask/features/clockIn/data/models/clock_in_response_model.dart';
import 'package:flutterdevtask/features/clockIn/data/models/work_hours_history_model.dart';
import 'package:flutterdevtask/features/clockIn/domain/repos/clock_in_repo.dart';

class ClockInRepoImpl extends BaseRepository implements IClockInRepo {
  final IClockInDatasource clockInDatasource;

  ClockInRepoImpl(this.clockInDatasource)
    : super(NetworkInfo(con: DataConnectionChecker()));

  @override
  Future<Either<Failure, ClockInResponseModel>> clockIn(
    ClockInRequestModel clockInRequestModel,
  ) async {
    return await handleException(
      () => clockInDatasource.clockIn(clockInRequestModel),
    );
  }

  @override
  Future<Either<Failure, List<WorkHoursHistoryModel>>>
  getWorkHoursHistory() async {
    return await handleException(() => clockInDatasource.getWorkHoursHistory());
  }
}
