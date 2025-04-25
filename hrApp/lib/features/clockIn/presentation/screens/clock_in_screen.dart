import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdevtask/core/base/base_state.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';
import 'package:flutterdevtask/core/helpers/utils/snack_bar_helper.dart';
import 'package:flutterdevtask/core/widgets/shimmer_loader.dart';
import 'package:flutterdevtask/features/clockIn/data/models/work_hours_history_model.dart';
import 'package:flutterdevtask/features/clockIn/presentation/cubit/clock_in_cubit.dart';
import 'package:flutterdevtask/features/clockIn/presentation/cubit/work_history_cubit.dart';
import 'package:flutterdevtask/features/clockIn/presentation/widgets/background_widget.dart';
import 'package:flutterdevtask/features/clockIn/presentation/widgets/clock_in_widget.dart';
import 'package:flutterdevtask/features/clockIn/presentation/widgets/header_widget.dart';
import 'package:flutterdevtask/features/clockIn/presentation/widgets/work_history_list_item.dart';

class ClockInScreen extends StatefulWidget {
  const ClockInScreen({super.key});

  @override
  State<ClockInScreen> createState() => _ClockInScreenState();
}

class _ClockInScreenState extends State<ClockInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCatalog.appBackgroundColor,
      body: BlocConsumer<ClockInCubit, BaseState>(
        listener: (context, state) {
          if (state is SuccessState) {
            showGlobalSnackBar(state.response.toString());
          }
        },
        builder: (context, clockInState) {
          if (clockInState is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Stack(
              children: [
                const BackgroundWidget(),
                SafeArea(
                  child: Column(
                    children: [
                      const HeaderWidget(),
                      ClockInWidget(
                        onTap: () {
                          context.read<ClockInCubit>().clockIn(DateTime.now());
                        },
                      ),
                      Expanded(
                        child: BlocBuilder<WorkHistoryCubit, BaseState>(
                          builder: (context, workHistoryState) {
                            if (workHistoryState is LoadingState) {
                              return const ShimmerLoader();
                            } else if (workHistoryState is FailureState) {
                              return const Center(
                                child: Text("Error loading work history"),
                              );
                            } else if (workHistoryState
                                is SuccessState<List<WorkHoursHistoryModel>>) {
                              final workHistory = workHistoryState.response;
                              if (workHistory!.isEmpty) {
                                return const Center(
                                  child: Text("No work history available"),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.only(bottom: 10.h),
                                itemCount: workHistory.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return WorkHistoryListItem(
                                    date: workHistory[index].date!,
                                    totalHours: workHistory[index].totalHours!,
                                    clockInTime:
                                        workHistory[index].clockInTime!,
                                    clockOutTime:
                                        workHistory[index].clockInTime!,
                                  );
                                },
                              );
                            } else {
                              return const Center(
                                child: Text("No work history available"),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
