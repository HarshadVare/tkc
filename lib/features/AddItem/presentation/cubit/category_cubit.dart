import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tkc/features/AddItem/data/category_impl.dart';
import 'package:tkc/features/AddItem/domain/repository/category_repository.dart';

part 'category_state.dart';

class GetAllCategoryCubit extends Cubit<GetAllCategoryState> {
  GetAllCategoryCubit() : super(GetAllCategoryInitial());
  final _categoryRepositoryImpl = CategoryRepositoryImpl();
}
