import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/presentation/view/widgets/best_seller_item_list.dart';
import 'package:book_app/features/home/presentation/view/widgets/boox_action.dart';
import 'package:book_app/features/home/presentation/view/widgets/customItemImage.dart';
import 'package:book_app/features/home/presentation/view/widgets/custom_appbar_details.dart';
import 'package:book_app/features/home/presentation/view/widgets/similar_box_list_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailsBody extends StatelessWidget {
  final String item;
  final String author;
  final String imageUrl;
  final dynamic price;
  final dynamic url;

  const BookDetailsBody({super.key, required this.item, required this.author, required this.imageUrl, required this.price, this.url, });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomAppBarDetails(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .2),
                  child: CustomBookImage(
                    imageUrl: imageUrl,
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  textAlign: TextAlign.center,
               item,
                  style: GoogleFonts.lobster(
                      textStyle: Styles.textStyle30
                          .copyWith(fontWeight: FontWeight.normal)),
                ),
                const SizedBox(
                  height: 6,
                ),
                Opacity(
                  opacity: 0.7,
                  child: Text(author,
                      style: Styles.textStyle18
                          .copyWith(fontWeight: FontWeight.normal)),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesomeIcons.solidStar,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '4.8',
                      style:
                          GoogleFonts.montserrat(textStyle: Styles.textStyle16),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        '(1895)',
                        style: GoogleFonts.montserrat(
                            textStyle: Styles.textStyle14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 37,
                ),
                 BoxAction(price: price,url: url,),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You Can Also Like',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w600),
                    )),
                const SizedBox(
                  height: 16,
                ),
                const SimilarBookListView(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
