import 'package:book_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BoxAction extends StatelessWidget {
  final dynamic price;
  final dynamic url;

  const BoxAction({super.key, required this.price, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children:  [
          Expanded(
              child: CustomButton(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            colorBackGround: Colors.white,
            colorText: Colors.black,
            text: '$price\$',
          )),
           Expanded(
              child: CustomButton(
                onPressed: ()async{
                  Uri uri=Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }

                },
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
                colorBackGround: const Color(0xffEf8262),
                colorText: Colors.white,
                text: 'Free Preview',
              )),

        ],
      ),
    );
  }
}
