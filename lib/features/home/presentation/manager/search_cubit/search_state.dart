part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchDataSuccess extends SearchState {}
class SearchDataLoading extends SearchState {}
class SearchDataFailed extends SearchState {}
