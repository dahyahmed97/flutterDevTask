import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdevtask/core/config/screen_size_config.dart';
import 'package:flutterdevtask/core/helpers/constants/resources/colors_catalog.dart';
import 'package:flutterdevtask/core/helpers/services/connectivity_service.dart';
import 'package:flutterdevtask/core/helpers/services/service_locator.dart';
import 'package:flutterdevtask/core/helpers/utils/preferences/pref_manager.dart';
import 'package:flutterdevtask/core/http/network_config/network_client.dart';
import 'package:flutterdevtask/core/localizations/app_localizations_setup.dart';
import 'package:flutterdevtask/core/localizations/cubit/locale_cubit.dart';
import 'package:flutterdevtask/core/localizations/providers.dart';
import 'package:flutterdevtask/core/route/route_catalog.dart';
import 'package:flutterdevtask/core/route/route_generator.dart';
import 'package:google_fonts/google_fonts.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey();
PrefManager? prefManager;

Future<void> main() async {
  ServiceLocator().setup();
  WidgetsFlutterBinding.ensureInitialized();

  final connectivityService = ConnectivityService();
  prefManager = getIt<PrefManager>();
  final providers = await BlocProviders.providers();
  // runApp(const MainApp());
  HttpOverrides.global = MyHttpOverrides();

  runApp(MultiBlocProvider(providers: providers, child: const MainApp()));
  connectivityService.initialize();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor:
          ColorsCatalog.appPurpleColor, // Change to your desired color
      statusBarIconBrightness:
          Brightness.light, // Light icons on dark background
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance.addObserver(this as WidgetsBindingObserver);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<LocaleCubit, LocaleState>(
      buildWhen: (previousState, currentState) => previousState != currentState,
      builder: (context, localestate) {
        return Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: ScreenUtilInit(
            designSize: Size(390, 844),
            minTextAdapt: true,
            splitScreenMode: true,
            builder:
                (context, child) => MaterialApp(
                  scaffoldMessengerKey:
                      scaffoldMessengerKey, // Global snackbar key
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    useMaterial3: true,
                    // colorScheme: const ColorScheme(
                    //   primary: ColorsCatalog.primary, // Primary color
                    //   onPrimary: Colors.white, // Text color on primary
                    //   secondary: ColorsCatalog.appGreen, // Accent color
                    //   onSecondary: Colors.black, // Text color on secondary
                    //   // Text color on background
                    //   surface: Colors.white, // Surface color
                    //   onSurface: Colors.black, // Text color on surface
                    //   error: Colors.red, // Error color
                    //   onError: Colors.white, // Text color on error
                    //   brightness: Brightness.light, // Light or dark theme
                    // ),
                    fontFamily: GoogleFonts.cairo().fontFamily,
                    textTheme: GoogleFonts.interTextTheme().copyWith(
                      headlineLarge: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      titleLarge: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      titleMedium: GoogleFonts.cairo(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                    colorScheme: const ColorScheme.light(
                      primary: ColorsCatalog.appPurpleColor,
                      surface: Colors.white,
                    ),
                    textSelectionTheme: const TextSelectionThemeData(
                      selectionColor: ColorsCatalog.appPurpleColor,
                    ),
                  ),
                  supportedLocales: AppLocalizationsSetup.supportedLocales,
                  localizationsDelegates:
                      AppLocalizationsSetup.localizationsDelegates,
                  locale: localestate.locale,
                  initialRoute: RoutesCatalog.homeScreen,
                  onGenerateRoute: AppRouter().generateRoute,
                ),
          ),
        );
      },
    );
  }
}
