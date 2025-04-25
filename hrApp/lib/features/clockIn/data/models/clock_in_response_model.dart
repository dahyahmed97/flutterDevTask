class ClockInResponseModel {
  final String? message;
  final bool? status;
  final String? code;

  ClockInResponseModel({this.message, this.status, this.code});

  factory ClockInResponseModel.fromJson(Map<String, dynamic> json) {
    return ClockInResponseModel(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      code: json['code'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'status': status, 'code': code};
  }
}
