import 'package:dartz/dartz.dart';
import 'package:flutterdevtask/core/error/failures.dart';
import 'package:flutterdevtask/features/clockIn/data/models/clock_in_request_model.dart';
import 'package:flutterdevtask/features/clockIn/data/models/clock_in_response_model.dart';
import 'package:flutterdevtask/features/clockIn/data/models/work_hours_history_model.dart';

abstract class IClockInRepo {
  Future<Either<Failure, ClockInResponseModel>> clockIn(
    ClockInRequestModel clockInRequestModel,
  );

  Future<Either<Failure, List<WorkHoursHistoryModel>>> getWorkHoursHistory();
}
