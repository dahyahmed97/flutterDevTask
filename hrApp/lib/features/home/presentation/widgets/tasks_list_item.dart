import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/assets_catalog.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';
import 'package:flutterdevtask/core/widgets/space.dart';
import 'package:flutterdevtask/features/home/data/models/tasks_model.dart';
import 'package:flutterdevtask/features/home/presentation/widgets/round_progress_bar.dart';
import 'package:flutterdevtask/features/home/presentation/widgets/task_details_chip.dart';

class TasksListItem extends StatelessWidget {
  final TasksModel task;
  const TasksListItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 12.h,
        left: 12.w,
        right: 12.w,
        bottom: 12.h,
      ),
      margin: EdgeInsets.only(top: 12.h),
      decoration: BoxDecoration(
        color: ColorsCatalog.appGrayBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorsCatalog.borderColor, width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(AssetCatalog.taskIcon),
              CustomSpace(widthFactor: 1),
              Text(
                task.title!,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: ColorsCatalog.listTitleColor,
                ),
              ),
            ],
          ),
          CustomSpace(heightFactor: 1),
          Row(
            children: [
              TaskDetailsChip(
                text: task.statusLabel!,
                icon: AssetCatalog.clockIcon,
                backgroundColor: ColorsCatalog.borderColor,
                textColor: ColorsCatalog.appSecondaryTextColor,
              ),
              CustomSpace(widthFactor: 1),
              TaskDetailsChip(
                icon: AssetCatalog.priorityIcon,
                text: task.priorityLabel!,
                backgroundColor: task.priorityColor!,
                textColor: Colors.white,
              ),
            ],
          ),
          CustomSpace(heightFactor: 1),
          AnimatedRoundedProgressBar(
            progress: task.progress!,
            progressColor: ColorsCatalog.appPurpleTextColor,
            backgroundColor: ColorsCatalog.progressBackgroundColor,
            duration: Duration(milliseconds: 1000),
          ),
          CustomSpace(heightFactor: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AssetCatalog.attenddes),
              Row(
                children: [
                  TaskDetailsChip(
                    text: task.endDate!,
                    icon: AssetCatalog.calendarIcon,
                    backgroundColor: Colors.white,
                    textColor: ColorsCatalog.appSecondaryTextColor,
                  ),
                  CustomSpace(widthFactor: 1),
                  TaskDetailsChip(
                    text: task.comments!.length.toString(),
                    icon: AssetCatalog.commentIcon,
                    backgroundColor: Colors.white,
                    textColor: ColorsCatalog.appSecondaryTextColor,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
