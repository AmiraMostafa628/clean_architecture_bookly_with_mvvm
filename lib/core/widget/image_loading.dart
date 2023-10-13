import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class ImageLoading extends StatelessWidget {
  const ImageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.6/4,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.07),
              borderRadius:
              const BorderRadius.all(Radius.circular(AppPadding.p16))),
        ));
  }
}
