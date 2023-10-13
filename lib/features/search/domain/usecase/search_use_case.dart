import 'package:clean_architecture_bookly/core/errors/failure.dart';
import 'package:clean_architecture_bookly/core/use_cases/use_case.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/search/domain/repos/search_repos.dart';
import 'package:dartz/dartz.dart';

class FetchSearchBooksUseCase extends UseCase2<List<BookEntity>,String,int>{
  final SearchRepo searchRepo;

  FetchSearchBooksUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> execute(String param, int param2)async {
    return await searchRepo.fetchSearchBooks(searchText: param,pageNumber: param2);
  }





}