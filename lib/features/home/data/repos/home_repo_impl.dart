import 'package:clean_architecture_bookly/core/errors/failure.dart';
import 'package:clean_architecture_bookly/features/home/data/local_data_source/home_local_data_source.dart';
import 'package:clean_architecture_bookly/features/home/data/remote_data_source/home_remote_data_source.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeLocalDataSource,
    required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber=0}) async{
    List<BookEntity> books;
  try{
     books= homeLocalDataSource.fetchFeaturedBooks(
       pageNumber: pageNumber
     );
    if(books.isNotEmpty){
      return right(books);
    }
     books = await homeRemoteDataSource.fetchFeaturedBooks(
         pageNumber: pageNumber);
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

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber = 0}) async {
    List<BookEntity> books;
    try{

      books= homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumber);
      if(books.isNotEmpty){
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks(
          pageNumber: pageNumber);
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

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks
      ( String category) async {
    try{
      List<BookEntity> books;

      books= homeLocalDataSource.fetchSimilarBooks();
      if (books.isNotEmpty)
        {
          return right(books);
        }
      books = await homeRemoteDataSource.fetchSimilarBooks(category: category);
        return right(books);
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