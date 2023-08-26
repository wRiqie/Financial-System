import 'dart:async';

import 'package:financial_system/business_logic/blocs/signin/signin_event.dart';
import 'package:financial_system/business_logic/blocs/signin/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninState()) {
    on<SigninLoginEvent>(_mapLoginEventToState);
  }

  Future<void> _mapLoginEventToState(
    SigninLoginEvent event,
    Emitter<SigninState> emit,
  ) async {
    emit(state.copyWith(
      status: SigninStatus.loading,
      loadingMessage: 'Entrando',
    ));
    // TODO Login

    emit(state.copyWith(
      status: SigninStatus.success,
    ));
  }
}
