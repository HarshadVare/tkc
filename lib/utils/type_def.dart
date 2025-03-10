import 'package:fpdart/fpdart.dart';
import 'package:tkc/utils/failure.dart';

///either failure or success and success type is any
typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
