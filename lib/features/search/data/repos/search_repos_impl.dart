import 'package:clean_architecture_bookly/core/errors/failure.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/search/data/remote_data_source/search_remote_data_source.dart';
import 'package:clean_architecture_bookly/features/search/domain/repos/search_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo{
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchBooks({required String searchText,int pageNumber=0})async {
    List<BookEntity> books;
    try{

      books = await searchRemoteDataSource.fetchSearchBooks(searchText: searchText,pageNumber:pageNumber);
      return  right(books);
    }
    catch(e){
      if(e is DioError)
      {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}