import 'package:clean_architecture_bookly/core/utils/functions/custom_snack_bar.dart';
import 'package:clean_architecture_bookly/core/widget/custom_error_widget.dart';
import 'package:clean_architecture_bookly/core/widget/newest_book_loading_indicator.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/newest_books_cubit/newest_books_states.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocConsumer extends StatelessWidget {
  const NewestBooksListViewBlocConsumer({
  super.key,
  });
  @override
  Widget build(BuildContext context) {

    List <BookEntity>books=[];

    return BlocConsumer<NewestBooksCubit,NewestBooksStates>(
      listener: (context,state){

        if(state is NewestBooksSuccess)
        {
          books.addAll(state.books);
        }
        if(state is NewestBooksPaginationFailure)
        {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(state.errMessage),
          );
        }

      },
        builder:(context,state){
        if(state is NewestBooksSuccess
            || state is NewestBooksPaginationLoading
            || state is NewestBooksPaginationFailure)
        {
            return  NewestBooksListView(books: books,);
          }
        else if(state is NewestBooksFailure)
          {
            return CustomErrorWidget(errMessage: state.errMessage,);
          }else
        {
          return const NewestBookLoadingIndicator();
        }
        });
  }
}

