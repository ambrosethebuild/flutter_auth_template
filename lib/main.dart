import 'package:flutter/material.dart';
import 'package:flutter_auth_template/constants/app_routes.dart';
import 'package:flutter_auth_template/services/auth.service.dart';
import 'package:flutter_auth_template/views/pages/auth/login.page.dart';
import 'package:flutter_auth_template/views/pages/home.page.dart';
import 'package:flutter_auth_template/views/pages/onboarding.page.dart';

import 'constants/app_colors.dart';
import 'constants/app_strings.dart';
import 'package:flutter_auth_template/services/router.service.dart' as router;

import 'package:i18n_extension/i18n_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set default home.
  // String _startRoute = AppRoutes.welcomeRoute;
  String _startRoute = AppRoutes.loginRoute;
  Widget homeWidget = OnboardingPage();

  //check if user has signin before
  await AuthServices.getPrefs();

  if (AuthServices.firstTimeOnApp()) {
    AuthServices.prefs.setBool(AppStrings.firstTimeOnApp, false);
  } else if (AuthServices.authenticated()) {
    _startRoute = AppRoutes.homeRoute;
    homeWidget = HomePage();
  } else {
    _startRoute = AppRoutes.loginRoute;
    homeWidget = LoginPage();
  }

  // Run app!
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      onGenerateRoute: router.generateRoute,
      initialRoute: _startRoute,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', "US"),
        const Locale('pt', "BR"),
      ],
      home: I18n(
        child: homeWidget,
      ),
      theme: ThemeData(
        accentColor: AppColor.accentColor,
        primaryColor: AppColor.primaryColor,
        primaryColorDark: AppColor.primaryColorDark,
        cursorColor: AppColor.cursorColor,
      ),
    ),
  );
}
