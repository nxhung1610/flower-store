import 'package:flower_store/src/utils/routes/app_routes.dart';
import 'package:flower_store/src/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411, 823),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flower Store',
        theme: appTheme(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: '/',
      ),
    );
  }
}
