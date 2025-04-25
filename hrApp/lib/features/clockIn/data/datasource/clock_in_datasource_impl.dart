import 'package:flutterdevtask/core/http/network_config/network.dart';
import 'package:flutterdevtask/features/clockIn/data/datasource/clock_in_datasource.dart';
import 'package:flutterdevtask/features/clockIn/data/models/clock_in_request_model.dart';
import 'package:flutterdevtask/features/clockIn/data/models/clock_in_response_model.dart';
import 'package:flutterdevtask/features/clockIn/data/models/work_hours_history_model.dart';

class ClockInDatasourceImpl implements IClockInDatasource {
  final Network network;
  ClockInDatasourceImpl(this.network);

  @override
  Future<ClockInResponseModel> clockIn(
    ClockInRequestModel clockInRequestModel,
  ) async {
    await Future.delayed(Duration(seconds: 1));
    return ClockInResponseModel(
      status: true,
      message: 'Clocked in successfully',
      code: "200",
    );
  }

  @override
  Future<List<WorkHoursHistoryModel>> getWorkHoursHistory() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      WorkHoursHistoryModel(
        date: "27 Sep 2024",
        clockInTime: "09:00 AM",
        clockOutTime: "05:00 PM",
        totalHours: "08:00:00",
      ),
      WorkHoursHistoryModel(
        date: "26 Sep 2024",
        clockInTime: "09:30 AM",
        clockOutTime: "05:30 PM",
        totalHours: "08:00:00",
      ),
      WorkHoursHistoryModel(
        date: "25 Sep 2024",
        clockInTime: "09:15 AM",
        clockOutTime: "05:15 PM",
        totalHours: "08:00:00",
      ),
      WorkHoursHistoryModel(
        date: "24 Sep 2024",
        clockInTime: "09:45 AM",
        clockOutTime: "05:45 PM",
        totalHours: "08:00:00",
      ),
    ];
  }
}
