import 'package:clean_architecture_bookly/core/utils/app_router.dart';
import 'package:clean_architecture_bookly/core/utils/bloc_observer.dart';
import 'package:clean_architecture_bookly/core/utils/constants_manager.dart';
import 'package:clean_architecture_bookly/core/utils/functions/di.dart';
import 'package:clean_architecture_bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:clean_architecture_bookly/features/home/domain/usecases/fetch_newest_books_use_case.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{

  await Hive.initFlutter();

  Hive.registerAdapter(BookEntityAdapter());

  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<BookEntity>(kSimilarBox);

  await Hive.openBox<String>(kSearchTextBox);

  initAppModule();

  Bloc.observer = MyBlocObserver();


  runApp(const Bookly());


}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:
            (context)=>FeaturedBooksCubit(FetchFeaturedBooksUseCase(
                instance.get<HomeRepoImpl>()),
            )..fetchFeaturedBooks(),),
        BlocProvider(create:
            (context)=>NewestBooksCubit(FetchNewestBooksUseCase(
            instance.get<HomeRepoImpl>()))..fetchNewestBooks()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme:  ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
        )
      ),
    );
  }
}



