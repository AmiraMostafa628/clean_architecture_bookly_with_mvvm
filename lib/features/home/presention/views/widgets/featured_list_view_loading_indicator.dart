import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:clean_architecture_bookly/core/widget/custom_fading_animations.dart';
import 'package:clean_architecture_bookly/core/widget/image_loading.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViewLoadingIndicator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndicator({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics:const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context,index)=>  const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
              child: ImageLoading(),
            )),

      ),
    );
  }
}