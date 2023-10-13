import 'package:flutter/material.dart';

class CustomFadingWidget extends StatefulWidget {
  const CustomFadingWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}


class _CustomFadingWidgetState extends State<CustomFadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    initAnimation();
   super.initState();
  }

  void initAnimation()
  {
    animationController = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 900));
    animation = Tween<double>(begin: 0.2,end: 0.8).animate(animationController)..addListener(() {
      setState(() {

      });
    });

    animationController.repeat(reverse:  true);

  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: animationController.value,
      child: widget.child,
    );
  }
}
