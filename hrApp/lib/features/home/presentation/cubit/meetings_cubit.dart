import 'package:flutterdevtask/core/helpers/services/service_locator.dart';
import 'package:flutterdevtask/features/home/domain/usecases/get_meetings_usecase.dart';

import '../../../../core/base/base_cubit.dart';
import '../../../../core/base/base_state.dart';
import '../../../../core/base/base_use_case.dart';
import '../../../../core/helpers/utils/preferences/pref_manager.dart';

class GetMeetingsCubit extends BaseCubit {
  var pref = getIt<PrefManager>();

  final GetMeetingsUseCase getMeetingsUseCase;

  GetMeetingsCubit(this.getMeetingsUseCase) : super(InitialState());

  Future<void> getMeetings() async {
    emit(LoadingState());
    var res = await getMeetingsUseCase.execute(NoParams());
    res.fold(
      (failure) {
        emitFailureState(failure.message);
      },
      (response) {
        if (response.isEmpty) {
          emitFailureState('No meetings found');
        } else {
          emit(SuccessState(response));
        }
      },
    );
  }
}
