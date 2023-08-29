import 'package:financial_system/business_logic/base_state.dart';

enum ForgotPasswordStatus {
  idle,
  loading,
  success,
  error;

  bool get isLoading => this == ForgotPasswordStatus.loading;
  bool get isSuccess => this == ForgotPasswordStatus.success;
  bool get isError => this == ForgotPasswordStatus.error;
}

final class ForgotPasswordState extends BaseState<ForgotPasswordStatus> {
  ForgotPasswordState({
    super.status = ForgotPasswordStatus.idle,
    super.loadingMessage,
    super.error,
  });

  ForgotPasswordState copyWith({
    required ForgotPasswordStatus status,
    String? loadingMessage,
    String? error,
  }) {
    return ForgotPasswordState(
      status: status,
      loadingMessage: loadingMessage ?? this.loadingMessage,
      error: error ?? this.error,
    );
  }
}
