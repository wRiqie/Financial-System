import 'package:financial_system/business_logic/base_state.dart';

enum SigninStatus {
  idle,
  loading,
  success,
  error;

  bool get isLoading => this == SigninStatus.loading;
  bool get isSuccess => this == SigninStatus.success;
  bool get isError => this == SigninStatus.error;
}

final class SigninState extends BaseState<SigninStatus> {
  SigninState({
    super.status = SigninStatus.idle,
    super.loadingMessage,
    super.error,
  });

  SigninState copyWith({
    required SigninStatus status,
    String? loadingMessage,
    String? error,
  }) {
    return SigninState(
      status: status,
      error: error ?? this.error,
      loadingMessage: loadingMessage ?? this.loadingMessage,
    );
  }
}
