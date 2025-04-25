import 'package:flutter/material.dart';

import 'package:flutterdevtask/features/home/data/models/meetings_model.dart';
import 'package:flutterdevtask/features/home/presentation/widgets/list_container_widget.dart';
import 'package:flutterdevtask/features/home/presentation/widgets/meeting_list_item.dart';

class MeetingsWidget extends StatelessWidget {
  final List<MeetingsModel> meetings;
  const MeetingsWidget({super.key, required this.meetings});

  @override
  Widget build(BuildContext context) {
    return ListContainerWidget(
      title: "Today's Meetings",
      description: "Your schedule for the day.",
      count: meetings.length.toString(),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return MeetingListItem(meeting: meetings[index]);
        },
        itemCount: meetings.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
