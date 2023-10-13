import 'package:clean_architecture_bookly/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class SlidingImage extends StatelessWidget {
  const SlidingImage({Key? key, required this.slidingAnimation}) : super(key: key);
  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context,_){
          return SlideTransition(
              position: slidingAnimation,
              child: Image.asset(AssetsManager.logoImage),
          );
        });
  }
}
