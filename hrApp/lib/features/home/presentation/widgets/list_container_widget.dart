import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';
import 'package:flutterdevtask/core/widgets/space.dart';

class ListContainerWidget extends StatelessWidget {
  final String title;
  final String description;
  final String count;
  final Widget child;
  const ListContainerWidget({
    super.key,
    required this.title,
    required this.description,
    required this.count,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: ColorsCatalog.appLightColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorsCatalog.borderColor, width: 1.r),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorsCatalog.appPrimaryTextColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: ColorsCatalog.appPurpleBackgroundColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      count,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: ColorsCatalog.appPurpleTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              const CustomSpace(heightFactor: 0.5),
            ],
          ),
          CustomSpace(heightFactor: 0.1),
          Text(
            description,
            style: TextStyle(color: ColorsCatalog.appSecondaryTextColor),
          ),
          CustomSpace(heightFactor: 0.5),
          child,
        ],
      ),
    );
  }
}
