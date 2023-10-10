import 'package:book_app/features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:book_app/features/home/presentation/manager/newest_books/newest_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/best_seller_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestCubit, NewestState>(
      builder: (context, state) {
        if (state is NewestGetDataSuccess) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: NewestCubit.get(context).result.length,
              itemBuilder: (context, index) {
                if (NewestCubit.get(context).result[index]['volumeInfo']
                            ['authors'] ==
                        null &&
                    NewestCubit.get(context).result[index]['volumeInfo']
                            ['imageLinks'] !=
                        null) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: BookListViewItem(
                        imageUrl: NewestCubit.get(context).result[index]
                            ['volumeInfo']['imageLinks']['thumbnail'],
                        title: 'Not Found !',
                        authors: 'Not Found !',
                      ));
                }
                if (NewestCubit.get(context).result[index]['volumeInfo']
                            ['authors'] !=
                        null &&
                    NewestCubit.get(context).result[index]['volumeInfo']
                            ['imageLinks'] ==
                        null) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: BookListViewItem(
                        title: 'Not Found !',
                        authors: 'Not Found !',
                      ));
                }
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: BookListViewItem(
                      title: NewestCubit.get(context)
                          .result[index]['volumeInfo']['title']
                          .toString(),
                      authors: NewestCubit.get(context)
                          .result[index]['volumeInfo']['authors'][0]
                          .toString(),
                      imageUrl: NewestCubit.get(context).result[index]
                          ['volumeInfo']['imageLinks']['thumbnail'],
                      price: NewestCubit.get(context).result[index]['saleInfo']
                              ['listPrice']?['amount'] ??
                          '0',
                      url: NewestCubit.get(context).result[index]['volumeInfo']
                          ['previewLink'],
                    ));
              });
        } else if (state is NewestGetDataFailed) {
          return const Center(child: Text('FAILED'));
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
