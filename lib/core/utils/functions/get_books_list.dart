import 'package:clean_architecture_bookly/features/home/data/models/book_model/book_model.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';

List<BookEntity> getBookList(Map<String, dynamic> data) {

  List<BookEntity> books=[];
  for(var bookMap in data['items'])
  {
    books.add(BookModel.fromJson(bookMap));
  }
  return books;
}
