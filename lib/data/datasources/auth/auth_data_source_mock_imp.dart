import 'package:financial_system/data/datasources/auth/auth_data_source.dart';
import 'package:financial_system/data/models/auth_model.dart';

class AuthDataSourceMockImp implements AuthDataSource {
  @override
  Future<AuthModel> signin(AuthModel login) {
    return Future.delayed(const Duration(seconds: 3), () {
      return login.copyWith(
        accessToken: 'fu0u409fueuje4f',
        refreshToken: 'ofje90f94fjs44904jffujs4fjsjf=',
      );
    });
  }
}
