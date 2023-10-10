import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  static SearchCubit get(context) =>
      BlocProvider.of<SearchCubit>(context);
  final HomeRepo homeRepo;
  List result=[];
  Future<void> fetchSearchBooks() async {
    emit(SearchDataLoading());
    result = await homeRepo.fetchSearchBooksBooks();
    emit(SearchDataSuccess());
    if (result.isEmpty) {
      emit(SearchDataFailed());
    }
  }
}
