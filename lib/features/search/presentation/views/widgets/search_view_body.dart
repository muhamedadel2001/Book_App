import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/search/presentation/views/widgets/custom_search_textfield.dart';
import 'package:book_app/features/search/presentation/views/widgets/list_search_items.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSearchTextField(),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Search Resultes',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 10,
          ),
          const Expanded(child: ListItemsSearch())
        ],
      ),
    );
  }
}
