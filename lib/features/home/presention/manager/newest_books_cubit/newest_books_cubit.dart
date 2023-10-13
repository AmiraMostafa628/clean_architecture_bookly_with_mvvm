import 'package:clean_architecture_bookly/features/home/domain/usecases/fetch_newest_books_use_case.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/newest_books_cubit/newest_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates>
{
  NewestBooksCubit(this.fetchNewestBooksUseCase):super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future <void> fetchNewestBooks({int pageNumber = 0})async{
    if(pageNumber==0) {
      emit(NewestBooksLoading());
    }
    else{
      emit(NewestBooksPaginationLoading());
    }

    var result = await fetchNewestBooksUseCase.execute(pageNumber);

    result.fold((failure) {
      if(pageNumber==0)
      {
        emit(NewestBooksFailure(failure.errMessage));
      }
      else{
        emit(NewestBooksPaginationFailure(failure.errMessage));
      }

    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }

}
