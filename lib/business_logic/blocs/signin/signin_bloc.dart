import 'dart:async';

import 'package:financial_system/business_logic/blocs/signin/signin_event.dart';
import 'package:financial_system/business_logic/blocs/signin/signin_state.dart';
import 'package:financial_system/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthRepository _authRepository;

  SigninBloc(this._authRepository) : super(SigninState()) {
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
    final response = await _authRepository.signin(login: event.auth);
    if (response.isSuccess) {
      emit(state.copyWith(
        status: SigninStatus.success,
      ));
    } else {
      emit(state.copyWith(
        status: SigninStatus.error,
        error: response.error?.message,
      ));
    }
  }
}
