import 'dart:async';

import 'package:book_app/screens.dart' as screens;
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/assets.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.w, bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.logo),
          Container(
            margin: EdgeInsets.only(left: 8.w),
            child: SlideTransition(
              position: slidingAnimation,
              child: Text(
                textAlign: TextAlign.center,
                'Read Free Books',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
              ),
            ),
          )
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    Timer(const Duration(milliseconds: 5000), () {
      Navigator.pushNamed(context, screens.homeScreen);
    });
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    slidingAnimation = Tween(begin: const Offset(0, 3), end: Offset.zero)
        .animate(animationController);
    super.initState();
  }
}
