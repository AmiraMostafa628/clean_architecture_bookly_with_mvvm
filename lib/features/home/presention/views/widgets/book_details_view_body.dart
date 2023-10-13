import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/book_details_section.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/custom_book_details_app_bar.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/similar_list_view_section.dart';
import 'package:flutter/material.dart';


class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.book}) : super(key: key);

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
              child: Column(
                children: [
                  const CustomBookDetailsAppBarView(),
                  BookDetailsSection(book: book,),
                  const Expanded(child: SizedBox(height: AppSize.s30,)),
                  const SimilarBooksSection(),
                  const SizedBox(height: AppSize.s40,),

                ],
              ),
            )
        )
      ],
    );
  }
}
