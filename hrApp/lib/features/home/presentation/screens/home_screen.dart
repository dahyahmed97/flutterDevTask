import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/assets_catalog.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';
import 'package:flutterdevtask/features/clockIn/presentation/screens/clock_in_screen.dart';
import 'package:flutterdevtask/features/home/presentation/cubit/home_tabs_cubit.dart';
import 'package:flutterdevtask/features/home/presentation/screens/landing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    Center(child: LandingScreen()),
    Center(child: ClockInScreen()),
    Center(child: Text('Not Implemented yet')),
    Center(child: Text('Not Implemented yet')),
    Center(child: Text('Not Implemented yet')),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body:
              _screens[currentIndex], // Display content based on the current tab
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 0,
            unselectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorsCatalog.appDarkColor,
            currentIndex: currentIndex,
            onTap: (index) => context.read<HomeTabCubit>().changeTab(index),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetCatalog.homeInactiveIcon),
                activeIcon: SvgPicture.asset(AssetCatalog.homeActiveIcon),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetCatalog.clockInInactiveIcon),
                activeIcon: SvgPicture.asset(AssetCatalog.clockInActiveIcon),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetCatalog.fillIcon3),
                activeIcon: SvgPicture.asset(AssetCatalog.fillIcon3),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetCatalog.fillIcon4),
                activeIcon: SvgPicture.asset(AssetCatalog.fillIcon4),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetCatalog.fillIcon5),
                activeIcon: SvgPicture.asset(AssetCatalog.fillIcon5),
                label: "",
              ),
            ],
          ),
        );
      },
    );
  }
}
