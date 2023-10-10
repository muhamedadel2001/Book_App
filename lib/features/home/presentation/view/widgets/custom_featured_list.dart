import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:book_app/features/home/presentation/view/widgets/customItemImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_app/screens.dart' as screens;

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksGetDataSuccess) {
          print(FeaturedBooksCubit.get(context).result.length);
          //print(FeaturedBooksCubit.get(context).result);
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: FeaturedBooksCubit.get(context).result.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (FeaturedBooksCubit.get(context).result[index]
                          ['volumeInfo']['imageLinks'] ==
                      null) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: const AspectRatio(
                          aspectRatio: 2.6 / 4,
                          child: Center(
                            child: Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, screens.bookDetails,
                          arguments: {
                            'imageUrl':
                                FeaturedBooksCubit.get(context).result[index]
                                    ['volumeInfo']['imageLinks']['thumbnail'],
                            'title': FeaturedBooksCubit.get(context)
                                .result[index]['volumeInfo']['title'],
                            'author':
                                FeaturedBooksCubit.get(context).result[index]
                                        ['volumeInfo']['authors']?[0] ??
                                    'null',
                            'price':
                                FeaturedBooksCubit.get(context).result[index]
                                        ['saleInfo']['listPrice']?['amount'] ??
                                    '0',
                            'url': FeaturedBooksCubit.get(context).result[index]['volumeInfo']['previewLink']
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CustomBookImage(
                          imageUrl:
                              FeaturedBooksCubit.get(context).result[index]
                                  ['volumeInfo']['imageLinks']['thumbnail']),
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksGetDataFailed) {
          return const Center(
              child: Text(
            'No Items Found',
            style: Styles.textStyle30,
          ));
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
