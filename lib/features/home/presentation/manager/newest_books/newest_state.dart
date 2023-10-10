part of 'newest_cubit.dart';

@immutable
abstract class NewestState {}

class NewestInitial extends NewestState {}
class NewestLoadingData extends NewestState {}
class NewestGetDataSuccess extends NewestState {}
class NewestGetDataFailed extends NewestState {}




