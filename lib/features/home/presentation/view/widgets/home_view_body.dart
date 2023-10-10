import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/presentation/view/widgets/best_seller_item_list.dart';
import 'package:book_app/features/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:book_app/features/home/presentation/view/widgets/custom_featured_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cutom_appbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppbar(),
            const FeaturedList(),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Newest',
              style: GoogleFonts.montserrat(textStyle: Styles.textStyle18),
            ),
            const SizedBox(
              height: 20,
            ),
            const BestSellerListView()
          ],
        ),
      ),
    );
  }
}
