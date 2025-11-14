import 'package:eventori/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';
import 'controller/lazy_controller.dart';
import 'routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
        return GetMaterialApp(
            initialRoute: AppRoutes.splash,
            // initialRoute: AppRoutes.socketTestScreen,
            getPages: AppPages.pages,
            initialBinding: LazyController(),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
            // theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            // home: SplashScreen()
        );

        //   GetMaterialApp(
        //   title: 'Flutter Demo',
        //   debugShowCheckedModeBanner: false,
        //   home: const SplashScreen(),
        // );
      },

    );
  }
}

