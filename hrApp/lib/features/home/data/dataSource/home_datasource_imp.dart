import 'package:flutterdevtask/core/http/network_config/network.dart';
import 'package:flutterdevtask/features/home/data/dataSource/home_datasource.dart';
import 'package:flutterdevtask/features/home/data/models/meetings_model.dart';
import 'package:flutterdevtask/features/home/data/models/tasks_model.dart';

class HomeDatasourceImp implements IHomeDatasource {
  final Network network;
  HomeDatasourceImp(this.network);

  @override
  Future<List<MeetingsModel>> getMeetings() async {
    await Future.delayed(Duration(seconds: 3)); // Simulate network delay

    return [
      MeetingsModel(
        id: 'm1',
        title: 'Design Review',
        description: 'Review the latest design mockups',
        numberOfAttendees: 3,
        startTime: '10:00 AM',
        endTime: '11:00 AM',
      ),
      MeetingsModel(
        id: 'm2',
        title: 'Sprint Planning',
        description: 'Plan tasks for the upcoming sprint',
        numberOfAttendees: 6,
        startTime: '10:00 PM',
        endTime: '12:00 PM',
      ),
      MeetingsModel(
        id: 'm1',
        title: 'Design Review',
        description: 'Review the latest design mockups',
        numberOfAttendees: 3,
        startTime: '10:00 AM',
        endTime: '11:00 AM',
      ),
    ];
  }

  @override
  Future<List<TasksModel>> getTasks() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    return [
      TasksModel(
        id: 101,
        title: 'Implement Login',
        endDate: '25 April',
        priority: 1,
        comments: ['Pending code review', 'Backend ready'],
        status: 1,
        numOfAssignees: 2,
        progress: 0.5,
      ),
      TasksModel(
        id: 102,
        title: 'Write Unit Tests',
        endDate: '27 April',
        priority: 2,
        comments: ['Focus on edge cases'],
        status: 2,
        progress: 0.7,
        numOfAssignees: 1,
      ),
      TasksModel(
        id: 102,
        title: 'Write Unit Tests',
        endDate: '30 April',
        priority: 3,
        comments: ['Focus on edge cases'],
        status: 3,
        progress: 0.7,
        numOfAssignees: 1,
      ),
    ];
  }
}
