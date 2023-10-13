import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';

abstract class SearchBooksStates{}

class SearchBooksInitialStates extends SearchBooksStates{}

class SearchBooksLoadingStates extends SearchBooksStates{}

class SearchBooksLoadingPaginationStates extends SearchBooksStates{}

class SearchBooksSuccessStates extends SearchBooksStates{
  final List <BookEntity> books;

  SearchBooksSuccessStates(this.books);

}

class SearchBooksErrorStates extends SearchBooksStates{
  final String errMessage;

  SearchBooksErrorStates(this.errMessage);

}


class SearchBooksErrorPaginationStates extends SearchBooksStates{
  final String errMessage;

  SearchBooksErrorPaginationStates(this.errMessage);

}