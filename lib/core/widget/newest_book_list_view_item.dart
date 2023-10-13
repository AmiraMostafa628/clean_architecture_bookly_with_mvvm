import 'package:clean_architecture_bookly/core/utils/app_router.dart';
import 'package:clean_architecture_bookly/core/utils/constants_manager.dart';
import 'package:clean_architecture_bookly/core/utils/style_manager.dart';
import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/book_image_item.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewestBooksListViewItem extends StatelessWidget {
  const NewestBooksListViewItem({Key? key, required this.book}) : super(key: key);


  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetails,extra:book);
      },
      child: SizedBox(
          height: AppSize.s125,
          child: Row(
            children: [
              CustomBookImageItem(image: book.image ??'',),
              const SizedBox(width: AppSize.s20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(book.title,
                        style: Styles.testStyle20.copyWith(fontFamily: gtSectraFine),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s5,
                    ),
                     Text(book.authorName!,
                      style: Styles.testStyle14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                    ),
                    const SizedBox(height: AppSize.s5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Free',
                          style: Styles.testStyle16.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                         BookRating(
                          rating: book.rating ?? 0,
                          count: book.ratingsCount ?? 0,
                        ),
                      ],),
                  ],
                ),
              ),


            ],
          )),
    );
  }
}