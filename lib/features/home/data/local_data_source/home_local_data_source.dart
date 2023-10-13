import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource{
  List<BookEntity> fetchFeaturedBooks({int pageNumber=0});
  List<BookEntity> fetchNewestBooks({int pageNumber=0});
  List<BookEntity> fetchSimilarBooks();
}

