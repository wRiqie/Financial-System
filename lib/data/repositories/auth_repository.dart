import 'package:financial_system/data/datasources/auth/auth_data_source.dart';
import 'package:financial_system/data/models/auth_model.dart';
import 'package:financial_system/data/models/default_response_model.dart';
import 'package:financial_system/data/services/execute_service.dart';

class AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepository(this._authDataSource);

  Future<DefaultResponseModel<AuthModel>> signin({required AuthModel login}) {
    return ExecuteService.tryExecuteAsync(() => _authDataSource.signin(login));
  }

  Future<DefaultResponseModel<bool>> recoverPassword(String email) {
    return ExecuteService.tryExecuteAsync(
        () => _authDataSource.recoverPassword(email));
  }
}
