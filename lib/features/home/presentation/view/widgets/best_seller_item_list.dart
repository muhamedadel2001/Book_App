import 'package:flutter/material.dart';

import 'package:book_app/screens.dart' as screens;
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/styles.dart';
import 'customItemImage.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
     required this.title,
     this.authors='',
     this.imageUrl='', this.price, this.url,
  });
   final String title;
  final String authors;
  final String imageUrl;
  final dynamic price;
  final dynamic url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, screens.bookDetails,arguments: {
          'title':title,
          'author':authors,
          'imageUrl':imageUrl,
          'price':price,
          'url':url,
        });
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(imageUrl: imageUrl),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          GoogleFonts.playfairDisplay(textStyle: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.w900
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    authors,
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                       Row(
                        children: const[
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text('4.8'),
                          Text('(1485)')
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
