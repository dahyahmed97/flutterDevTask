class MoreDetails {
  int? errorCategory;
  int? errorCode;

  MoreDetails({this.errorCategory, this.errorCode});

  MoreDetails.fromJson(Map<String, dynamic> json) {
    errorCategory = json['errorCategory'];
    errorCode = json['errorCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorCategory'] = errorCategory;
    data['errorCode'] = errorCode;
    return data;
  }
}
