import 'package:clean_architecture_bookly/features/home/domain/usecases/fetch_similar_books_use_case.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/similar_book_cubit/similar_book_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksStates>{
  SimilarBooksCubit(this.fetchSimilarBooksUseCase):super(SimilarBooksInitialStates());

  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks({required String category})async {
    emit(SimilarBooksLoadingStates());

    var result = await fetchSimilarBooksUseCase.execute(category);

    result.fold((failure) {
      emit(SimilarBooksErrorStates(failure.errMessage));
    }, (books){
      emit(SimilarBooksSuccessStates(books));
    });

  }
}