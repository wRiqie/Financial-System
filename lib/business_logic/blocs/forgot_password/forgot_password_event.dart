abstract class ForgotPasswordEvent {}

class ForgotPasswordSendEvent implements ForgotPasswordEvent {
  final String email;

  ForgotPasswordSendEvent({
    required this.email,
  });
}
