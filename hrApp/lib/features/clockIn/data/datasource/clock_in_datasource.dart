import 'package:flutterdevtask/features/clockIn/data/models/clock_in_request_model.dart';
import 'package:flutterdevtask/features/clockIn/data/models/clock_in_response_model.dart';
import 'package:flutterdevtask/features/clockIn/data/models/work_hours_history_model.dart';

abstract class IClockInDatasource {
  Future<ClockInResponseModel> clockIn(ClockInRequestModel clockInRequestModel);

  Future<List<WorkHoursHistoryModel>> getWorkHoursHistory();
}
