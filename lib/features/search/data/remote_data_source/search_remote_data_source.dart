import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource{
  Future<List<BookEntity>> fetchSearchBooks({required String searchText,int pageNumber=0});
}