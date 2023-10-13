import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:clean_architecture_bookly/core/widget/newest_book_list_view_item.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({Key? key, required this.books}) : super(key: key);

  final List<BookEntity> books;

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;

  bool isLoading = false;

  @override
  void initState() {
    _scrollController= ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();

  }
  void _scrollListener()async{
    double currentPosition = _scrollController.position.pixels;
    double maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLength) {
        if(!isLoading) {
          isLoading=true;
        await BlocProvider.of<NewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);
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
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: widget.books.length,
      itemBuilder: (context,index)=> Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
        child: NewestBooksListViewItem(book: widget.books[index],),
      ),
    );
  }
}








