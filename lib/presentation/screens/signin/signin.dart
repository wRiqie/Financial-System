import 'package:financial_system/business_logic/blocs/signin/signin_bloc.dart';
import 'package:financial_system/presentation/screens/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninBloc(GetIt.I()),
      child: const SigninScreen(),
    );
  }
}
