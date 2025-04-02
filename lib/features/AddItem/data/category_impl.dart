import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tkc/features/AddItem/domain/repository/category_repository.dart';
import 'package:tkc/services/dio_client.dart';
import 'package:tkc/utils/failure.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllCategory(
      String username, String password) async {
    try {
      final response = await DioClient().apiRequestWithDio(
        url:
            'https://firestore.googleapis.com/v1/projects/tkc-app-1a038/databases/(default)/documents/categories',
        // requestBody: body,
        requestType: HttpMethod.get,
      );
      if (response.statusCode == 200) {
        if (response.data != null && response.data is Map<String, dynamic>) {
          return right(response.data as Map<String, dynamic>);
        } else {
          return left(Failure('Data not found'));
        }
      } else {
        return left(Failure('Data not found'));
      }
    } on DioException catch (e) {
      // Handle custom error message from interceptor
      return left(Failure(e.error.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
