import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/similar_book_cubit/similar_book_cubit.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({Key? key, required this.book}) : super(key: key);

  final BookEntity book;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).
    fetchSimilarBooks(category: widget.book.categories?[0] ?? '');

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: BookDetailsViewBody(book: widget.book,)),
    );
  }
}
