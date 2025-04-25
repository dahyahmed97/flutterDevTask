import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdevtask/core/helpers/services/service_locator.dart';
import 'package:flutterdevtask/core/route/route_catalog.dart';
import 'package:flutterdevtask/features/clockIn/presentation/cubit/clock_in_cubit.dart';
import 'package:flutterdevtask/features/clockIn/presentation/cubit/work_history_cubit.dart';
import 'package:flutterdevtask/features/home/presentation/cubit/home_tabs_cubit.dart';
import 'package:flutterdevtask/features/home/presentation/cubit/meetings_cubit.dart';
import 'package:flutterdevtask/features/home/presentation/cubit/tasks_cubit.dart';
import 'package:flutterdevtask/features/home/presentation/screens/home_screen.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    //showLog("navigation", settings.name);

    if (settings.name != '/') {
      // FBAnalytics().sendScreen(settings.name);
    }

    Widget disableBackButton(Widget child) {
      return PopScope(
        canPop: false, // <- Critical change

        child: child,
      );
    }

    switch (settings.name) {
      case RoutesCatalog.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => disableBackButton(
                MultiBlocProvider(
                  providers: [
                    BlocProvider<HomeTabCubit>(
                      create: (_) => getIt<HomeTabCubit>(),
                    ),
                    BlocProvider<GetMeetingsCubit>(
                      create: (_) => getIt<GetMeetingsCubit>()..getMeetings(),
                    ),
                    BlocProvider<GetTasksCubit>(
                      create: (_) => getIt<GetTasksCubit>()..getTasks(),
                    ),
                    BlocProvider<WorkHistoryCubit>(
                      create:
                          (_) => getIt<WorkHistoryCubit>()..getWorkHistory(),
                    ),
                    BlocProvider<ClockInCubit>(
                      create: (_) => getIt<ClockInCubit>(),
                    ),
                  ],
                  child: const HomeScreen(),
                ),
              ),
        );
    }
    return null;
  }
}
