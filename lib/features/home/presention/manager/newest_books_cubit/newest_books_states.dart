import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';

abstract class NewestBooksStates{}

class NewestBooksInitial extends NewestBooksStates{}

class NewestBooksLoading extends NewestBooksStates{}

class NewestBooksPaginationLoading extends NewestBooksStates{}

class NewestBooksSuccess extends NewestBooksStates{
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}

class NewestBooksFailure extends NewestBooksStates{
  final String errMessage;

  NewestBooksFailure(this.errMessage);

}

class NewestBooksPaginationFailure extends NewestBooksStates{
  final String errMessage;

  NewestBooksPaginationFailure(this.errMessage);

}