import 'package:book_app/constants.dart';
import 'package:book_app/features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:book_app/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:book_app/features/search/presentation/views/widgets/custom_search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_app/screens.dart' as screens;

import '../../../../home/presentation/view/widgets/best_seller_item_list.dart';

class ListItemsSearch extends StatelessWidget {
  const ListItemsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchDataSuccess) {
          return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: SearchCubit.get(context).result.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, screens.bookDetails);
                  },
                  child: BookListViewItem(
                    title: SearchCubit.get(context).result[index]['volumeInfo']
                        ['title'],
                    authors: SearchCubit.get(context).result[index]
                        ['volumeInfo']['authors'][0],
                    imageUrl: SearchCubit.get(context).result[index]
                        ['volumeInfo']['imageLinks']['thumbnail'],
                    price: 'Free',
                    url: SearchCubit.get(context).result[index]['volumeInfo']
                        ['previewLink'],
                  ),
                );
              });
        }
        if (state is SearchDataLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        }
        if (state is SearchDataFailed) {
          return const Center(child: Text('No Item Found'));
        } else {
          return Container();
        }
      },
    );
  }
}
