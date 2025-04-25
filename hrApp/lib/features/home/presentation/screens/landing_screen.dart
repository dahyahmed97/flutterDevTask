import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterdevtask/core/base/base_state.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/assets_catalog.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';
import 'package:flutterdevtask/core/helpers/utils/snack_bar_helper.dart';
import 'package:flutterdevtask/core/widgets/shimmer_loader.dart';
import 'package:flutterdevtask/core/widgets/space.dart';
import 'package:flutterdevtask/features/home/data/models/meetings_model.dart';
import 'package:flutterdevtask/features/home/data/models/tasks_model.dart';
import 'package:flutterdevtask/features/home/presentation/cubit/meetings_cubit.dart';
import 'package:flutterdevtask/features/home/presentation/cubit/tasks_cubit.dart';
import 'package:flutterdevtask/features/home/presentation/widgets/home_banner_widget.dart';
import 'package:flutterdevtask/features/home/presentation/widgets/meetings_widget.dart';
import 'package:flutterdevtask/features/home/presentation/widgets/tasks_widget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsCatalog.appBackgroundColor,
        appBar: _buildAppBar("Employee", "Junior Full Stack Developer"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomSpace(heightFactor: 2),
              HomeBannerWidget(
                image: AssetCatalog.bannerIcon,
                title: "My Work Summary",
                description: "Today task & presence activity",
              ),
              CustomSpace(heightFactor: 2),
              BlocConsumer<GetMeetingsCubit, BaseState>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    List<MeetingsModel> meetings = state.response;
                    return MeetingsWidget(meetings: meetings);
                  } else if (state is FailureState) {
                    return const Center(child: Text("Error loading meetings"));
                  } else if (state is LoadingState) {
                    return ShimmerLoader();
                  }
                  return Container();
                },
                listener: (context, state) {
                  if (state is LoadingState) {
                  } else if (state is FailureState) {
                    showGlobalSnackBar(state.error!);
                  } else {}
                },
              ),
              CustomSpace(heightFactor: 2),
              BlocConsumer<GetTasksCubit, BaseState>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    List<TasksModel> tasks = state.response;
                    return TasksWidget(tasks: tasks);
                  } else if (state is FailureState) {
                    return const Center(child: Text("Error loading tasks"));
                  } else if (state is LoadingState) {
                    return ShimmerLoader();
                  }
                  return Container();
                },
                listener: (context, state) {
                  if (state is FailureState) {
                    showGlobalSnackBar(state.error!);
                  }
                },
              ),
              CustomSpace(heightFactor: 1),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar(String userName, String title) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 75.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: ColorsCatalog.appLightColor,
          border: Border(
            bottom: BorderSide(color: ColorsCatalog.borderColor, width: 1.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AssetCatalog.avatarIcon),
                CustomSpace(widthFactor: 1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          userName,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: ColorsCatalog.appDarkColor,
                          ),
                        ),
                        CustomSpace(widthFactor: 0.5),
                        SvgPicture.asset(AssetCatalog.verfiedIcon),
                      ],
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: ColorsCatalog.appPurpleColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Row(children: [SvgPicture.asset(AssetCatalog.messageIcon)]),
                CustomSpace(widthFactor: 1),
                Row(
                  children: [SvgPicture.asset(AssetCatalog.notificationsIcon)],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
