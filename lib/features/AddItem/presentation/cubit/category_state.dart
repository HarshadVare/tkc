part of 'category_cubit.dart';

@immutable
sealed class GetAllCategoryState {}

final class GetAllCategoryInitial extends GetAllCategoryState {}

final class GetAllCategoryLoaded extends GetAllCategoryState {}

final class GetAllCategoryError extends GetAllCategoryState {}
