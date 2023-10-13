import 'package:clean_architecture_bookly/core/utils/api_services.dart';
import 'package:clean_architecture_bookly/core/utils/constants_manager.dart';
import 'package:clean_architecture_bookly/core/utils/functions/get_books_list.dart';
import 'package:clean_architecture_bookly/core/utils/functions/save_books_data.dart';
import 'package:clean_architecture_bookly/features/home/data/remote_data_source/home_remote_data_source.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber=0}) async{
    var data = await apiServices.getResponse(
        endPoint:'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber*10}');

    List<BookEntity> books = getBookList(data);

    saveBooksData(books,kFeaturedBox);

    return books;

  }


  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber=0})async {
    var data = await apiServices.getResponse(
        endPoint:'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science&startIndex=${pageNumber*10}');

    List<BookEntity> books = getBookList(data);

    saveBooksData(books,kNewestBox);

    return books;

  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category})async {
    var data = await apiServices.getResponse(
        endPoint:'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category');

    List<BookEntity> books = getBookList(data);

    saveBooksData(books,kSimilarBox);

    return books;

  }


}