import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';

abstract class SimilarBooksStates{}

class SimilarBooksInitialStates extends SimilarBooksStates{}

class SimilarBooksLoadingStates extends SimilarBooksStates{}

class SimilarBooksSuccessStates extends SimilarBooksStates{
  final List <BookEntity> books;

  SimilarBooksSuccessStates(this.books);

}

class SimilarBooksErrorStates extends SimilarBooksStates{
  final String errMessage;

  SimilarBooksErrorStates(this.errMessage);

}