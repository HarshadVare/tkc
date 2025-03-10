import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tkc/features/Login/domain/repository/login_repository.dart';
import 'package:tkc/services/dio_client.dart';
import 'package:tkc/utils/failure.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
      String username, String password) async {
    try {
      Map<String, dynamic> body = {
        "email": username,
        "password": password,
        "returnSecureToken": true
      };

      final response = await DioClient().apiRequestWithDio(
        url:
            'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDetx1vk_TGHT22V0_nbXCp53M3PHfYjus',
        requestBody: body,
        requestType: HttpMethod.post,
      );
      if (response.statusCode == 200) {
        if (response.data != null && response.data is Map<String, dynamic>) {
          return right(response.data as Map<String, dynamic>);
        } else {
          return left(Failure('Data not found'));
        }
      } else {
        return left(Failure(response.data['error']['message']));
      }
    } on DioException catch (e) {
      // Handle custom error message from interceptor
      return left(Failure(e.error.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
