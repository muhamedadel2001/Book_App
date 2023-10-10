import 'package:book_app/features/home/presentation/view/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final dynamic price;
  final dynamic url;
  const BookDetails({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.price,
    this.url,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
          child: BookDetailsBody(
        item: title,
        author: author,
        imageUrl: imageUrl,
        price: price,
         url: url,
      )),
    );
  }
}
