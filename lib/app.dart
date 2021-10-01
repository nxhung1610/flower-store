import 'package:flower_store/src/blocs/welcome/welcome_cubit.dart';
import 'package:flower_store/src/screens/screen.dart';
import 'package:flower_store/src/utils/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/utils/routes/app_routes.dart';
import 'src/utils/themes/theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    printLog("[AppState] build");
    return MultiBlocProvider(
      providers: [
        BlocProvider<WelcomeCubit>(create: (context) => WelcomeCubit()),
      ],
      child: AppInit(),
    );
  }
}

class AppInit extends StatelessWidget {
  const AppInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flower Store',
      theme: AppTheme(),
      initialRoute: WelcomeScreen.nameRoute,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
