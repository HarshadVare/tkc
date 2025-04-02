import 'package:fpdart/fpdart.dart';
import 'package:tkc/utils/failure.dart';

abstract class CategoryRepository {
  const CategoryRepository();

  Future<Either<Failure, Map<String, dynamic>>> getAllCategory(
      String username, String password);
}
