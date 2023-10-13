import 'package:clean_architecture_bookly/core/errors/failure.dart';
import 'package:clean_architecture_bookly/core/use_cases/use_case.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,int>{
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> execute([int param = 0]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber: param);
  }

}