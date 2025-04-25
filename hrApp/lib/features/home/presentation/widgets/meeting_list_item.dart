import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/assets_catalog.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';
import 'package:flutterdevtask/core/helpers/utils/snack_bar_helper.dart';
import 'package:flutterdevtask/core/widgets/custom_elevated_btn.dart';
import 'package:flutterdevtask/core/widgets/space.dart';
import 'package:flutterdevtask/features/home/data/models/meetings_model.dart';

class MeetingListItem extends StatelessWidget {
  final MeetingsModel meeting;
  const MeetingListItem({super.key, required this.meeting});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AssetCatalog.meetingIcon),
                  CustomSpace(widthFactor: 1),
                  Text(
                    meeting.title!,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: ColorsCatalog.listTitleColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(AssetCatalog.clockIcon),
                  Text(
                    meeting.startTime!,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: ColorsCatalog.listTitleColor,
                    ),
                  ),
                  CustomSpace(widthFactor: 0.5),
                  Text(
                    "-",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: ColorsCatalog.listTitleColor,
                    ),
                  ),
                  CustomSpace(widthFactor: 0.5),
                  Text(
                    meeting.endTime!,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: ColorsCatalog.listTitleColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          CustomSpace(heightFactor: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AssetCatalog.attenddes),
                  CustomSpace(widthFactor: 0.5),
                  Text(
                    meeting.numberOfAttendees! > 3
                        ? "+${meeting.numberOfAttendees}"
                        : "",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: ColorsCatalog.listSubTitleColor,
                    ),
                  ),
                ],
              ),
              CustomElevatedButton(
                onPressed: () {
                  showGlobalSnackBar("Join Meet");
                },
                text: "Join Meet",
                height: 25.h,
                width: 100.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
