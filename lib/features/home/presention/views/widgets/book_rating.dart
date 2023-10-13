import 'package:clean_architecture_bookly/core/utils/style_manager.dart';
import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({Key? key,
    this.mainAxisAlignment= MainAxisAlignment.start, required this.rating, required this.count}) : super(key: key);

  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final num count;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: mainAxisAlignment ,
      children:  [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(width: AppSize.s5,),
        Text('$rating',
          style: Styles.testStyle16,
        ),
        const SizedBox(width: AppSize.s5,),
        Opacity(
          opacity: .5,
          child: Text('($count)',
              style: Styles.testStyle14.copyWith(
                  fontWeight: FontWeight.w600
              )
          ),
        )
      ],
    );
  }
}