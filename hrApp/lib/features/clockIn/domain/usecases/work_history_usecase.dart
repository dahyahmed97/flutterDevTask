import 'package:dartz/dartz.dart';
import 'package:flutterdevtask/core/error/failures.dart';
import 'package:flutterdevtask/features/clockIn/data/models/work_hours_history_model.dart';
import 'package:flutterdevtask/features/clockIn/domain/repos/clock_in_repo.dart';

import '../../../../core/base/base_use_case.dart';

class WorkHistoryUsecase
    extends BaseUseCase<List<WorkHoursHistoryModel>, NoParams> {
  final IClockInRepo clockInRepo;

  WorkHistoryUsecase(this.clockInRepo);

  @override
  Future<Either<Failure, List<WorkHoursHistoryModel>>> execute(
    NoParams params,
  ) async {
    return clockInRepo.getWorkHoursHistory();
  }
}
