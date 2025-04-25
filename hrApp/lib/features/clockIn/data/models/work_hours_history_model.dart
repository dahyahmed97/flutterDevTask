class WorkHoursHistoryModel {
  final String? id;
  final String? date;
  final String? clockInTime;
  final String? clockOutTime;
  final String? totalHours;

  WorkHoursHistoryModel({
    this.id,
    this.date,
    this.clockInTime,
    this.clockOutTime,
    this.totalHours,
  });
  factory WorkHoursHistoryModel.fromJson(Map<String, dynamic> json) {
    return WorkHoursHistoryModel(
      id: json['id'] as String?,
      date: json['date'] as String?,
      clockInTime: json['clockInTime'] as String?,
      clockOutTime: json['clockOutTime'] as String?,
      totalHours: json['totalHours'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'clockInTime': clockInTime,
      'clockOutTime': clockOutTime,
      'totalHours': totalHours,
    };
  }
}
