import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/home_repo.dart';

part 'newest_state.dart';

class NewestCubit extends Cubit<NewestState> {
  static NewestCubit get(context) => BlocProvider.of<NewestCubit>(context);
  NewestCubit(this.homeRepo) : super(NewestInitial());
  final HomeRepo homeRepo;
  List result=[];
  Future<void> fetchNewestBooks() async {
    emit(NewestLoadingData());
     result = await homeRepo.fetchNewestBooks();
    emit(NewestGetDataSuccess());
    if (result.isEmpty) {
      emit(NewestGetDataFailed());
    }
  }
}
