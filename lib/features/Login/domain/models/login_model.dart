class LoginModel {
  final String username;
  final String accessToken;
  final String refreshToken;
  final String expiresIn;

  LoginModel(
      {required this.username,
      required this.accessToken,
      required this.refreshToken,
      required this.expiresIn});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        username: json["email"] ?? '',
        accessToken: json["idToken"] ?? '',
        refreshToken: json["refreshToken"] ?? '',
        expiresIn: json["expiresIn"] ?? '',
      );
}
