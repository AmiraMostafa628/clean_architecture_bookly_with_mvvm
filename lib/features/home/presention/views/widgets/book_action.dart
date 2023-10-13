import 'package:clean_architecture_bookly/core/utils/functions/launch_url.dart';
import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:clean_architecture_bookly/core/widget/custom_button.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({Key? key, required this.book}) : super(key: key);

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      child: Row(
        children: [
           Expanded(
            child: CustomButton(
              onPressed: (){},
                backgroundColor: Colors.white,
                textColor: Colors.black ,
                text: 'Free',
                fontSize: AppSize.s14,
              borderRadius: const BorderRadius.only(
                topLeft:Radius.circular(AppSize.s16),
                bottomLeft: Radius.circular(AppSize.s16),)
            ),
          ),
          Expanded(child: CustomButton(
            onPressed: () {
              launchCustomUrl(context,
                  book.previewLink);
            },
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            text: getText(book),
            fontSize: AppSize.s12,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(AppSize.s16),
                bottomRight: Radius.circular(AppSize.s16)
            ),
          )),
        ],
      ),
    );
  }
  String getText(BookEntity book){
    if(book.previewLink == null)
    {
      return 'Not Available';
    }
    else {
      return 'Preview';
    }
  }
}
