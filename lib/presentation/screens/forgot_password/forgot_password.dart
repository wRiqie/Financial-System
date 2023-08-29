import 'package:financial_system/business_logic/blocs/forgot_password/forgot_password_bloc.dart';
import 'package:financial_system/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordBloc(GetIt.I()),
      child: const ForgotPasswordScreen(),
    );
  }
}
