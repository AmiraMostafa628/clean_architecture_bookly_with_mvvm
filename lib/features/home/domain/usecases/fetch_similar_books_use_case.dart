import 'package:clean_architecture_bookly/core/errors/failure.dart';
import 'package:clean_architecture_bookly/core/use_cases/use_case.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>,String>{
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> execute(String param) async {
    return await homeRepo.fetchSimilarBooks(param);
  }

}