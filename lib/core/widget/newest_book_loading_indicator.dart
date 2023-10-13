
import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:clean_architecture_bookly/core/widget/custom_fading_animations.dart';
import 'package:clean_architecture_bookly/core/widget/image_loading.dart';
import 'package:clean_architecture_bookly/core/widget/text_loading.dart';
import 'package:flutter/material.dart';

class NewestBookLoadingIndicator extends StatelessWidget {
  const NewestBookLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomFadingWidget(
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          physics:const NeverScrollableScrollPhysics(),
          itemCount: 10,
          shrinkWrap: true,
          separatorBuilder: (context,index)=>const SizedBox(height: AppSize.s10,),
          itemBuilder: (context,index){
            return  const SizedBox(
          height: AppSize.s125,
          child: Row(
            children: [
              ImageLoading(),
              SizedBox(
                width: AppSize.s30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextLoading(width: .5,),
                    SizedBox(
                      height: AppSize.s10,
                    ),
                    TextLoading(width: .3,),
                    SizedBox(
                      height: AppSize.s15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextLoading(width: .25,),
                        TextLoading(width: .15,),

                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),
        );
      })
    );
  }
}