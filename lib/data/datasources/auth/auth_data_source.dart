import 'package:financial_system/data/models/auth_model.dart';

abstract class AuthDataSource {
  Future<AuthModel> signin(AuthModel login);
}
