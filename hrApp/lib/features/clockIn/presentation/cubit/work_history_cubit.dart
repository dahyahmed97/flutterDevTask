import 'package:flutterdevtask/core/base/base_cubit.dart';
import 'package:flutterdevtask/core/base/base_state.dart';
import 'package:flutterdevtask/core/base/base_use_case.dart';
import 'package:flutterdevtask/core/helpers/services/service_locator.dart';
import 'package:flutterdevtask/core/helpers/utils/preferences/pref_manager.dart';
import 'package:flutterdevtask/features/clockIn/domain/usecases/work_history_usecase.dart';

class WorkHistoryCubit extends BaseCubit {
  var pref = getIt<PrefManager>();

  final WorkHistoryUsecase workHistoryUsecase;

  WorkHistoryCubit(this.workHistoryUsecase) : super(InitialState());

  Future<void> getWorkHistory() async {
    emit(LoadingState());
    var res = await workHistoryUsecase.execute(NoParams());
    res.fold(
      (failure) {
        emitFailureState(failure.message);
      },
      (response) {
        if (response.isEmpty) {
          emitFailureState('No work history found');
        } else {
          emit(SuccessState(response));
        }
      },
    );
  }
}
