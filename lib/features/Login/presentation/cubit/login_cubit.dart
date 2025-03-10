import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tkc/features/Login/data/login_repository_impl.dart';
import 'package:tkc/features/Login/domain/models/login_model.dart';
import 'package:tkc/utils/failure.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final _loginRepositoryImpl = LoginRepositoryImpl();
  final Box _authBox = Hive.box('authBox');

  login({required String username, required String password}) async {
    emit(LoginLoading());

    final result = await _loginRepositoryImpl.login(username, password);

    result.fold((error) {
      emit(LoginError(error: Failure(error.message)));
    }, (success) {
      if (success['registered'] == true) {
        final loginData = LoginModel.fromJson(success);
        _saveTokens(loginData.accessToken, loginData.refreshToken);

        emit(LoginSuccess(data: loginData));
        emit(Authenticated());
      } else {
        emit(LoginError(error: Failure('Login failed')));
      }
      //save tokens in hive
    });
  }

  Future<void> checkAuthStatus() async {
    final accessToken = await getAccessToken();
    if (accessToken != null) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> logout() async {
    await _authBox.clear();
    emit(Unauthenticated());
  }

  /// Method to save tokens in Hive
  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    await _authBox.put('accessToken', accessToken);
    await _authBox.put('refreshToken', refreshToken);
  }

  Future<String?> getAccessToken() async => await _authBox.get('accessToken');

  Future<String?> getRefreshToken() async => await _authBox.get('refreshToken');
}
