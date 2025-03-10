import 'package:fpdart/fpdart.dart';
import 'package:tkc/utils/failure.dart';

abstract class LoginRepository {
  const LoginRepository();

  Future<Either<Failure, Map<String, dynamic>>> login(
      String username, String password);
}
