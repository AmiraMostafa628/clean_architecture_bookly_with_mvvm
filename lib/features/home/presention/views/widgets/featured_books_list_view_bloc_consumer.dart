import 'package:clean_architecture_bookly/core/widget/custom_error_widget.dart';
import 'package:clean_architecture_bookly/core/utils/functions/custom_snack_bar.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/featured_books_cubit/featured_books_states.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/featured_list_view.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/featured_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListViewBlocConsumer extends StatefulWidget {
  const FeaturedListViewBlocConsumer({
  super.key,
  });

  @override
  State<FeaturedListViewBlocConsumer> createState() => _FeaturedListViewBlocConsumerState();
}

class _FeaturedListViewBlocConsumerState extends State<FeaturedListViewBlocConsumer> {
  @override
  Widget build(BuildContext context) {
     List<BookEntity> books=[];
    return BlocConsumer<FeaturedBooksCubit,FeaturedBooksStates>(
      listener:(context,state){
        if(state is FeaturedBooksSuccess)
          {
            books.addAll(state.books);
          }
        if(state is FeaturedBooksPaginationFailure)
        {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(state.errMessage),
          );
        }
      },
        builder:(context,state){
          if(state is FeaturedBooksSuccess
              || state is FeaturedBooksPaginationLoading
              || state is FeaturedBooksPaginationFailure)
          {
            return FeaturedBooksListView(books: books,);

          } else if(state is FeaturedBooksFailure)
            {
              return CustomErrorWidget(errMessage: state.errMessage,);
            }else
              {
                return const FeaturedBooksListViewLoadingIndicator();
              }

        });
  }


}

