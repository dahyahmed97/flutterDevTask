import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/assets_catalog.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';
import 'package:flutterdevtask/features/clockIn/presentation/widgets/gradient_button.dart';

class ClockInWidget extends StatelessWidget {
  final Function()? onTap;
  const ClockInWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      margin: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Working Hour',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 18.sp,
              color: ColorsCatalog.appPrimaryTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Paid Period 1 Sept 2024 - 30 Sept 2024',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildTimeCard(
                  title: 'Today',
                  time: '00:00 Hrs',
                  context: context,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTimeCard(
                  title: 'This Pay Period',
                  time: '32:00 Hrs',
                  context: context,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GradientButton(onTap: onTap),
        ],
      ),
    );
  }

  Widget _buildTimeCard({
    required String title,
    required String time,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsCatalog.timeBoxBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsCatalog.timeBoxBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(AssetCatalog.clockIcon),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 12.sp,
                  color: ColorsCatalog.appSecondaryTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            time,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20.sp,
              color: ColorsCatalog.appPrimaryTextColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
