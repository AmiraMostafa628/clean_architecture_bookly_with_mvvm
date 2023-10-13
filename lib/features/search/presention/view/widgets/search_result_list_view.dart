import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:clean_architecture_bookly/core/widget/newest_book_list_view_item.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/search/presention/manager/search_cubit.dart';
import 'package:clean_architecture_bookly/features/search/presention/view/widgets/cache_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SearchResultListView extends StatefulWidget {
  const SearchResultListView({
  super.key, required this.books,

  });

  final List<BookEntity> books;

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {

  late ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;
  @override
 void initState()  {

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }
  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading && boxData.isNotEmpty) {
        isLoading = true;
        await BlocProvider.of<SearchBooksCubit>(context)
            .fetchSearchBooks(searchText:boxData, pageNumber: nextPage++);
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
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemBuilder: (context,index)=> Padding(
        padding:const EdgeInsets.symmetric(vertical: AppPadding.p10),
        child: NewestBooksListViewItem(book:widget.books[index] ,),
      ),
      itemCount: widget.books.length,
    );
  }
}
