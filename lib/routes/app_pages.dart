import 'package:financial_system/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/signin/signin.dart';

class AppPages {
  static Map<String, Widget Function(BuildContext context)> values = {
    AppRoutes.signin: (context) => const Signin()
  };
}
