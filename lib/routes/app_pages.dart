import 'package:financial_system/presentation/screens/forgot_password/forgot_password.dart';
import 'package:financial_system/presentation/screens/home/home.dart';
import 'package:financial_system/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/signin/signin.dart';

class AppPages {
  static Map<String, Widget Function(BuildContext context)> values = {
    AppRoutes.signin: (context) => const Signin(),
    AppRoutes.home: (context) => const Home(),
    AppRoutes.forgotPassword: (context) => const ForgotPassword(),
  };
}
