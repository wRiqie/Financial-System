class AuthModel {
  String? email;
  String? password;
  String? accessToken;
  String? refreshToken;

  AuthModel({
    this.email,
    this.password,
    this.accessToken,
    this.refreshToken,
  });

  Map<String, dynamic> toSignin() {
    return {
      'email': email,
      'password': password,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  AuthModel copyWith({
    String? email,
    String? password,
    String? accessToken,
    String? refreshToken,
  }) {
    return AuthModel(
      email: email ?? this.email,
      password: password ?? this.password,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
