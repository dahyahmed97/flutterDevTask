class ClockInRequestModel {
  DateTime? clockInTime;

  ClockInRequestModel({this.clockInTime});
  Map<String, dynamic> toJson() {
    return {'clockInTime': clockInTime?.toIso8601String()};
  }

  factory ClockInRequestModel.fromJson(Map<String, dynamic> json) {
    return ClockInRequestModel(
      clockInTime: DateTime.parse(json['clockInTime']),
    );
  }
}
