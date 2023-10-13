import 'package:clean_architecture_bookly/core/utils/app_router.dart';
import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:clean_architecture_bookly/features/splash/presentaion/view/widgets/sliding_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation <Offset> slidingAnimation;

  @override
  void initState() {
    initAnimation();
    navigateToHome();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
     mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
          child: SlidingImage(slidingAnimation: slidingAnimation,),
        )
      ],
    );
  }

  void initAnimation()
  {
    animationController = AnimationController(vsync: this,
        duration: const Duration(seconds:1));
    slidingAnimation = Tween<Offset>(
        begin: const Offset(3,0),end: Offset.zero).animate(animationController);
    animationController.forward();

  }

  void navigateToHome()
  {
    Future.delayed(const Duration(seconds: 3),(){
      GoRouter.of(context).push(AppRouter.kHome);

    });
  }
}
