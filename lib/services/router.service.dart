import 'package:flutter/material.dart';
import 'package:flutter_auth_template/constants/app_routes.dart';
import 'package:flutter_auth_template/views/pages/auth/forgot_password.page.dart';
import 'package:flutter_auth_template/views/pages/auth/login.page.dart';
import 'package:flutter_auth_template/views/pages/auth/register.page.dart';
import 'package:flutter_auth_template/views/pages/home.page.dart';
import 'package:flutter_auth_template/views/pages/onboarding.page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.welcomeRoute:
      return MaterialPageRoute(builder: (context) => OnboardingPage());

    case AppRoutes.loginRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case AppRoutes.registerRoute:
      return MaterialPageRoute(builder: (context) => RegisterPage());

    case AppRoutes.forgotPasswordRoute:
      return MaterialPageRoute(builder: (context) => ForgotPasswordPage());

    case AppRoutes.homeRoute:
      return MaterialPageRoute(
        settings: RouteSettings(name: AppRoutes.homeRoute, arguments: Map()),
        builder: (context) => HomePage(),
      );

    default:
      return MaterialPageRoute(builder: (context) => OnboardingPage());
  }
}
