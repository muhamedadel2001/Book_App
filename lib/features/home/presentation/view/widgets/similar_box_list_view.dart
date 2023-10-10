import 'package:book_app/features/home/presentation/manager/similar_books/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customItemImage.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccessData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              padding: EdgeInsets.zero,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CustomBookImage(
                          imageUrl: SimilarBooksCubit.get(context).result[index]
                              ['volumeInfo']['imageLinks']?['thumbnail']??'null'));
                }),
          );
        }
        if (state is SimilarBooksFailedData) {
          return Container();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
