import 'package:flower_store/src/blocs/auth/auth_bloc.dart';
import 'package:flower_store/src/blocs/init/init_bloc.dart';
import 'package:flower_store/src/blocs/main/bottom_nav/navigator_app_bar_bloc.dart';
import 'package:flower_store/src/screens/init/init_screen.dart';
import 'package:flower_store/src/screens/screen.dart';
import 'package:flower_store/src/utils/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocProvider<InitBloc>(
          create: (context) => InitBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<NavigatorAppBarBloc>(
          create: (context) => NavigatorAppBarBloc(),
        )
      ],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: AppInit(),
      ),
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
      initialRoute: InitScreen.nameRoute,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
