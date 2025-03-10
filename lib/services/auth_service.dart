

import 'package:hive_flutter/hive_flutter.dart';

class AuthService {
  static const String _authBoxName = 'authBox';

  late Box _authBox;

  AuthService() {
    _authBox = Hive.box(_authBoxName);
  }

  Future<bool> isUserLoggedIn() async {
    return getAccessToken() != null;
  }

  Future<void> login(String accessToken, String refreshToken) async {
    await _saveTokens(accessToken, refreshToken);
  }

  Future<void> logout() async {
    await _authBox.clear();
  }

  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    await _authBox.put('accessToken', accessToken);
    await _authBox.put('refreshToken', refreshToken);
  }

  String? getAccessToken() => _authBox.get('accessToken');

  String? getRefreshToken() => _authBox.get('refreshToken');
}
