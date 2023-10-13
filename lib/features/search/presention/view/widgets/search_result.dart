import 'package:clean_architecture_bookly/core/utils/style_manager.dart';
import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:clean_architecture_bookly/core/widget/custom_error_widget.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/search/presention/manager/search_cubit.dart';
import 'package:clean_architecture_bookly/features/search/presention/manager/search_states.dart';
import 'package:clean_architecture_bookly/features/search/presention/view/widgets/search_result_list_view.dart';
import 'package:clean_architecture_bookly/features/search/presention/view/widgets/search_result_list_view_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultBlocConsumer extends StatelessWidget {
  const SearchResultBlocConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List <BookEntity> books=[];
    return  BlocConsumer<SearchBooksCubit,SearchBooksStates>(
      listener: (context,state){
        if(state is SearchBooksSuccessStates)
        {
          books.addAll(state.books);
        }
      },
      builder: (context,state){
        const Text(
          'Search Result',
          style: Styles.testStyle18,
        );
        const SizedBox(
        height: AppSize.s16,
        );
        if(state is SearchBooksSuccessStates
            || state is SearchBooksLoadingPaginationStates
            || state is SearchBooksErrorPaginationStates)
        {
          return SearchResultListView(books: books,);
        }
        else if(state is SearchBooksLoadingStates)
        {
          return const SearchResultLoading();
        }
        else if(state is SearchBooksErrorStates)
        {
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        else
        {
          return Container();
        }
      },
    );
  }
}


