import 'package:clean_architecture_bookly/core/utils/app_router.dart';
import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:clean_architecture_bookly/core/widget/custom_error_widget.dart';
import 'package:clean_architecture_bookly/core/widget/image_loading.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/similar_book_cubit/similar_book_cubit.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/similar_book_cubit/similar_book_states.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksStates>(
      builder: (context,state){
        if(state is SimilarBooksSuccessStates) {
          return buildSimilarBooks(context, state);
        }
        else if(state is SimilarBooksErrorStates)
        {
          return CustomErrorWidget(errMessage: state.errMessage,);
        }
        else {
          return buildSimilarLoadingBooks(context);
        }
      },
    );
  }

  SizedBox buildSimilarLoadingBooks(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) =>  const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p5),
            child: ImageLoading(),
          )),
    );
  }

  SizedBox buildSimilarBooks(BuildContext context, SimilarBooksSuccessStates state) {
    return SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) =>  Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p5),
                child: GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.kBookDetails,
                        extra: state.books[index]
                    );
                  },
                  child: CustomBookImageItem(
                    image: state.books[index].image ?? '',
                  ),
                ),
              )),
        );
  }
}
