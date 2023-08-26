import 'package:financial_system/data/models/auth_model.dart';

abstract class SigninEvent {}

class SigninLoginEvent implements SigninEvent {
  final AuthModel auth;

  SigninLoginEvent({required this.auth});
}
