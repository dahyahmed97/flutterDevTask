import 'package:dartz/dartz.dart';
import 'package:flutterdevtask/core/base/base_use_case.dart';
import 'package:flutterdevtask/core/error/failures.dart';
import 'package:flutterdevtask/features/home/data/models/meetings_model.dart';
import 'package:flutterdevtask/features/home/domain/repos/home_repo.dart';

class GetMeetingsUseCase extends BaseUseCase<List<MeetingsModel>, NoParams> {
  final IHomeRepo homeRepo;

  GetMeetingsUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<MeetingsModel>>> execute(NoParams params) async {
    return homeRepo.getMeetings();
  }
}
