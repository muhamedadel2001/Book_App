import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  static FeaturedBooksCubit get(context) =>
      BlocProvider.of<FeaturedBooksCubit>(context);
  final HomeRepo homeRepo;
  List result = [];
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoadingData());
    result = await homeRepo.fetchFeaturedBooks();
    emit(FeaturedBooksGetDataSuccess());
    if (result.isEmpty) {
      emit(FeaturedBooksGetDataFailed());
    }
  }
}
