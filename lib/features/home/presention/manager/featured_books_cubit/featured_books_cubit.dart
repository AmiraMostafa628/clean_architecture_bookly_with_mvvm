import 'package:clean_architecture_bookly/features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/featured_books_cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates>{
  FeaturedBooksCubit(this.featuredBooksUseCase):super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

 Future <void> fetchFeaturedBooks({int pageNumber = 0})async{
   if(pageNumber ==0) {
      emit(FeaturedBooksLoading());
    }
   else{
     emit(FeaturedBooksPaginationLoading());
   }
    var result = await featuredBooksUseCase.execute(pageNumber);

    result.fold((failure) {
     if(pageNumber ==0)
       {
         emit(FeaturedBooksFailure(failure.errMessage));
       }
     else{
       emit(FeaturedBooksPaginationFailure(failure.errMessage));
     }
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}