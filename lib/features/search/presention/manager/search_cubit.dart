
import 'package:clean_architecture_bookly/features/search/domain/usecase/search_use_case.dart';
import 'package:clean_architecture_bookly/features/search/presention/manager/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksCubit extends Cubit<SearchBooksStates>{
  SearchBooksCubit(this.fetchSearchBooksUseCase):super(SearchBooksInitialStates());

  final FetchSearchBooksUseCase fetchSearchBooksUseCase;

  static SearchBooksCubit get(context) => BlocProvider.of(context);



  Future<void> fetchSearchBooks({required String searchText ,int pageNumber = 0})async {

    if(pageNumber==0) {
      emit(SearchBooksLoadingStates());
    }
    else{
      emit(SearchBooksLoadingPaginationStates());
    }
    var result = await fetchSearchBooksUseCase.execute(searchText,pageNumber);

    result.fold((failure) {
      if(pageNumber==0) {
        emit(SearchBooksErrorStates(failure.errMessage));
      }
      else{
        emit(SearchBooksErrorPaginationStates(failure.errMessage));
      }
    }, (books){
      emit(SearchBooksSuccessStates(books));
    });

  }
}