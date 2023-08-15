import 'package:app/features/add_city/ui/add_city_screen.dart';
import 'package:app/features/home/ui/home_screen.dart';
import 'package:app/features/search/ui/seacrh_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
          '/welcome': (context) => HomeScreen(),
          '/search': (context) => SearchScreen(),
          '/add_city': (context) => AddCityScreen(),
        },
      ),
    );
  }
}
