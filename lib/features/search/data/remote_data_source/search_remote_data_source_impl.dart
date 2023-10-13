import 'package:clean_architecture_bookly/core/utils/api_services.dart';
import 'package:clean_architecture_bookly/core/utils/functions/get_books_list.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/search/data/remote_data_source/search_remote_data_source.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource{
  final ApiServices apiServices;

  SearchRemoteDataSourceImpl(this.apiServices);
  @override
  Future<List<BookEntity>> fetchSearchBooks({required String searchText,int pageNumber =0})async {
      var data = await apiServices.getResponse(endPoint:
      'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$searchText&startIndex=${pageNumber*10}');

      List<BookEntity> books = getBookList(data);

      return books;



  }
}