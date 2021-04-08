import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lora_app/ui/screens/home/home_screen.dart';
import 'package:lora_app/utils/themes.dart';
import 'utils/utils.dart';

import 'auth/authentication_bloc.dart';
import 'ui/screens/login/login_screen.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc()..add(AppStarted()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'QuicksandRegular',
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 14),
          ),
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: Colors.transparent),
          scaffoldBackgroundColor: Colors.white,
          accentColor: LoraColors.primary,
          primaryColor: LoraColors.primary,
          focusColor: LoraColors.primary,
          dividerColor: Colors.transparent,
          backgroundColor: LoraColors.background,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        title: 'LORA TECH',
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationAuthenticated) {
              return BlocProvider.value(
                value: context.watch<AuthenticationBloc>(),
                child: HomeScreen(),
              );
            }

            if (state is LoginScreen) {
              return LoginScreen();
            }

            return Scaffold(
              body: Text('loading'),
            );
          },
        ),
      ),
    );
  }
}
