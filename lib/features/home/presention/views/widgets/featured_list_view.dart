import 'package:clean_architecture_bookly/core/utils/app_router.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key, required this.books})
      : super(key: key);

  final List<BookEntity> books;

  @override
  State<StatefulWidget> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;

  bool isLoading = false;

  @override
  void initState()  {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);


  }

  /*void executeSimilarBooks() async {
    for(var book in widget.books) {
      await BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(book);
    }
  }*/

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: ()  {
                  GoRouter.of(context).push(AppRouter.kBookDetails,
                      extra: widget.books[index]
                  );
              },
              child: CustomBookImageItem(
                image: widget.books[index].image ?? '',
              ),
            ),
          );
        },
      ),
    );
  }
}



