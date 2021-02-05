import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './utils/app_routes.dart';
import './views/home_screen.dart';
import './views/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SuggestInBox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Lato',
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt'),
      ],
      routes: {
        AppRoutes.LOGIN: (ctx) => LoginScreen(),
        AppRoutes.HOME: (ctx) => HomeScreen(),
      },
    );
  }
}
