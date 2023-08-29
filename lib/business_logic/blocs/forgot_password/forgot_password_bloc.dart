import 'dart:async';

import 'package:financial_system/business_logic/blocs/forgot_password/forgot_password_event.dart';
import 'package:financial_system/business_logic/blocs/forgot_password/forgot_password_state.dart';
import 'package:financial_system/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository _authRepository;

  ForgotPasswordBloc(this._authRepository) : super(ForgotPasswordState()) {
    on<ForgotPasswordSendEvent>(_mapSendEventToState);
  }

  Future<void> _mapSendEventToState(
      ForgotPasswordSendEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(
      status: ForgotPasswordStatus.loading,
    ));
    final response = await _authRepository.recoverPassword(event.email);
    if (response.isSuccess && response.data == true) {
      emit(state.copyWith(
        status: ForgotPasswordStatus.success,
      ));
    } else {
      emit(state.copyWith(
        status: ForgotPasswordStatus.error,
        error: state.error,
      ));
    }
  }
}
