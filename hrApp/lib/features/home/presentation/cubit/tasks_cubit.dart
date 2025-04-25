import 'package:flutterdevtask/core/base/base_cubit.dart';
import 'package:flutterdevtask/core/base/base_state.dart';
import 'package:flutterdevtask/core/base/base_use_case.dart';
import 'package:flutterdevtask/core/helpers/services/service_locator.dart';
import 'package:flutterdevtask/core/helpers/utils/preferences/pref_manager.dart';
import 'package:flutterdevtask/features/home/domain/usecases/get_tasks_usecase.dart';

class GetTasksCubit extends BaseCubit {
  var pref = getIt<PrefManager>();

  final GetTasksUsecase getTasksUsecase;

  GetTasksCubit(this.getTasksUsecase) : super(InitialState());

  Future<void> getTasks() async {
    emit(LoadingState());
    var res = await getTasksUsecase.execute(NoParams());
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
