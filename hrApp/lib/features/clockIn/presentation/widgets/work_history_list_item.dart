import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';
import 'package:flutterdevtask/core/widgets/space.dart';

class WorkHistoryListItem extends StatelessWidget {
  final String date;
  final String totalHours;
  final String clockInTime;
  final String clockOutTime;
  const WorkHistoryListItem({
    super.key,
    required this.date,
    required this.totalHours,
    required this.clockInTime,
    required this.clockOutTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      margin: EdgeInsets.only(top: 13.h, left: 12.w, right: 12.w),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorsCatalog.appPrimaryTextColor,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: ColorsCatalog.appGrayBackgroundColor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: ColorsCatalog.timeBoxBorderColor),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Total Hours
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Hours',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: ColorsCatalog.appSecondaryTextColor,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        totalHours,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorsCatalog.appSecondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  // Clock In & Out
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Clock in & Out',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: ColorsCatalog.appSecondaryTextColor,
                        ),
                      ),
                      CustomSpace(heightFactor: 1),
                      Text(
                        '$clockInTime - $clockOutTime',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorsCatalog.appSecondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
