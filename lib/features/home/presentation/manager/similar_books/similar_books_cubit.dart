import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  static SimilarBooksCubit get(context) =>
      BlocProvider.of<SimilarBooksCubit>(context);
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  List result = [];
  Future<void> similarBooks() async {
    emit(SimilarBooksLoadingData());
    result = await homeRepo.fetchSimilarBooks();
    emit(SimilarBooksSuccessData());
    if (result.isEmpty) {
      emit(SimilarBooksFailedData());
    }
  }
}
