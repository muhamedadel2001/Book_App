import 'package:book_app/constants.dart';
import 'package:book_app/features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:book_app/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(16)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(16)),
          hintText: 'Search..',
          suffixIcon: IconButton(
            onPressed: () {
              SearchCubit.get(context).fetchSearchBooks();
            },
            icon: const Opacity(
                opacity: 0.8, child: Icon(FontAwesomeIcons.magnifyingGlass)),
          )),
    );
  }


}
