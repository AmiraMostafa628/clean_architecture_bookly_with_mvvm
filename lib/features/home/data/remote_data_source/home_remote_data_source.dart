import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource{
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber=0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber=0});
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

