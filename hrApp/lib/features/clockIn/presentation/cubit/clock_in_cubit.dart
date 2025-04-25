import 'package:flutterdevtask/core/base/base_cubit.dart';
import 'package:flutterdevtask/core/base/base_state.dart';
import 'package:flutterdevtask/core/helpers/services/service_locator.dart';
import 'package:flutterdevtask/core/helpers/utils/preferences/pref_manager.dart';
import 'package:flutterdevtask/features/clockIn/domain/usecases/clock_in_usecase.dart';
import 'package:flutterdevtask/features/clockIn/data/models/clock_in_request_model.dart';

class ClockInCubit extends BaseCubit {
  var pref = getIt<PrefManager>();

  final ClockInUsecase clockInUsecase;

  ClockInCubit(this.clockInUsecase) : super(InitialState());

  Future<void> clockIn(DateTime clockInDateTime) async {
    emit(LoadingState());
    var res = await clockInUsecase.execute(
      ClockInRequestModel(clockInTime: clockInDateTime),
    );
    res.fold(
      (failure) {
        emitFailureState(failure.message);
      },
      (response) {
        if (response.status == false) {
          emitFailureState('Error while clocking in');
        } else {
          emit(SuccessState("Clocked in successfully"));
        }
      },
    );
  }
}
