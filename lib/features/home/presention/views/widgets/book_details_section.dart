import 'package:clean_architecture_bookly/core/utils/constants_manager.dart';
import 'package:clean_architecture_bookly/core/utils/style_manager.dart';
import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/book_action.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/book_image_item.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);

 final BookEntity book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width *.2),
          child:  CustomBookImageItem(image: book.image ?? '',),
        ),
        const SizedBox(
          height: AppSize.s40,
        ),
        Text(book.title,
          style: Styles.testStyle20.copyWith(fontFamily: gtSectraFine),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: AppSize.s6,
        ),
        Opacity(
          opacity: .7,
          child: Text(book.authorName!,
            textAlign: TextAlign.center,
            style: Styles.testStyle18.copyWith(
              fontStyle: FontStyle.italic,

            ),
          ),
        ),
        const SizedBox(
          height: AppSize.s18,
        ),
         BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.rating ?? 0,
          count: book.ratingsCount ?? 0,
        ),
        const SizedBox(height: AppSize.s30,),
        BookAction(book: book,)
      ],
    );
  }
}
