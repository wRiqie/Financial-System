base class BaseState<TStatus extends Enum> {
  final TStatus status;
  final String? loadingMessage;
  final String? error;

  BaseState({
    required this.status,
    this.loadingMessage,
    this.error,
  });
}
