class MeetingsModel {
  String? id;
  String? title;
  String? description;
  int? numberOfAttendees;
  String? startTime;
  String? endTime;

  MeetingsModel({
    this.id,
    this.title,
    this.description,
    this.numberOfAttendees,
    this.startTime,
    this.endTime,
  });

  MeetingsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    numberOfAttendees = json['numberOfAttendees'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['numberOfAttendees'] = numberOfAttendees;
    data['startTime'] = startTime;
    data['endTime'] = endTime;

    return data;
  }
}
