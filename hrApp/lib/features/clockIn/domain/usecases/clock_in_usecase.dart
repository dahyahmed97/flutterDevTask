import 'package:dartz/dartz.dart';
import 'package:flutterdevtask/core/base/base_use_case.dart';
import 'package:flutterdevtask/core/error/failures.dart';
import 'package:flutterdevtask/features/clockIn/data/models/clock_in_request_model.dart';
import 'package:flutterdevtask/features/clockIn/data/models/clock_in_response_model.dart';
import 'package:flutterdevtask/features/clockIn/domain/repos/clock_in_repo.dart';

class ClockInUsecase
    extends BaseUseCase<ClockInResponseModel, ClockInRequestModel> {
  final IClockInRepo clockInRepo;

  ClockInUsecase(this.clockInRepo);

  @override
  Future<Either<Failure, ClockInResponseModel>> execute(
    ClockInRequestModel params,
  ) async {
    return clockInRepo.clockIn(params);
  }
}
