import 'package:flutterdevtask/core/http/network_config/network.dart';
import 'package:flutterdevtask/core/http/network_config/network_client.dart';
import 'package:flutterdevtask/features/clockIn/data/datasource/clock_in_datasource.dart';
import 'package:flutterdevtask/features/clockIn/data/datasource/clock_in_datasource_impl.dart';
import 'package:flutterdevtask/features/clockIn/data/repoImpl/clock_in_repo_impl.dart';
import 'package:flutterdevtask/features/clockIn/domain/usecases/clock_in_usecase.dart';
import 'package:flutterdevtask/features/clockIn/domain/usecases/work_history_usecase.dart';
import 'package:flutterdevtask/features/clockIn/domain/repos/clock_in_repo.dart';
import 'package:flutterdevtask/features/clockIn/presentation/cubit/clock_in_cubit.dart';
import 'package:flutterdevtask/features/clockIn/presentation/cubit/work_history_cubit.dart';
import 'package:flutterdevtask/features/home/data/dataSource/home_datasource.dart';
import 'package:flutterdevtask/features/home/data/dataSource/home_datasource_imp.dart';
import 'package:flutterdevtask/features/home/data/reposImpl/home_repo_impl.dart';
import 'package:flutterdevtask/features/home/domain/usecases/get_meetings_usecase.dart';
import 'package:flutterdevtask/features/home/domain/usecases/get_tasks_usecase.dart';
import 'package:flutterdevtask/features/home/domain/repos/home_repo.dart';
import 'package:flutterdevtask/features/home/presentation/cubit/home_tabs_cubit.dart';
import 'package:flutterdevtask/features/home/presentation/cubit/meetings_cubit.dart';
import 'package:flutterdevtask/features/home/presentation/cubit/tasks_cubit.dart';
import 'package:get_it/get_it.dart';
import '../utils/preferences/pref_manager.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void setup() {
    getIt.registerSingleton<PrefManager>(PrefManager());

    getIt.registerSingleton<Network>(Network(networkClient: NetworkClient()));

    getIt.registerSingleton<IHomeDatasource>(
      HomeDatasourceImp(getIt<Network>()),
    );

    getIt.registerSingleton<IHomeRepo>(HomeRepo(getIt<IHomeDatasource>()));

    getIt.registerSingleton<GetMeetingsUseCase>(
      GetMeetingsUseCase(getIt<IHomeRepo>()),
    );

    getIt.registerSingleton<GetTasksUsecase>(
      GetTasksUsecase(getIt<IHomeRepo>()),
    );

    getIt.registerFactory(() => HomeTabCubit());

    getIt.registerFactory(() => GetMeetingsCubit(getIt<GetMeetingsUseCase>()));

    getIt.registerFactory(() => GetTasksCubit(getIt<GetTasksUsecase>()));

    getIt.registerSingleton<IClockInDatasource>(
      ClockInDatasourceImpl(getIt<Network>()),
    );

    getIt.registerSingleton<IClockInRepo>(
      ClockInRepoImpl(getIt<IClockInDatasource>()),
    );

    getIt.registerSingleton<ClockInUsecase>(
      ClockInUsecase(getIt<IClockInRepo>()),
    );

    getIt.registerSingleton<WorkHistoryUsecase>(
      WorkHistoryUsecase(getIt<IClockInRepo>()),
    );
    getIt.registerFactory(() => ClockInCubit(getIt<ClockInUsecase>()));

    getIt.registerFactory(() => WorkHistoryCubit(getIt<WorkHistoryUsecase>()));
  }
}
