import 'package:clean_architecture_bookly/core/utils/functions/di.dart';
import 'package:clean_architecture_bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:clean_architecture_bookly/features/home/domain/usecases/fetch_similar_books_use_case.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/similar_book_cubit/similar_book_cubit.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/book_details_view.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/home_view.dart';
import 'package:clean_architecture_bookly/features/search/data/repos/search_repos_impl.dart';
import 'package:clean_architecture_bookly/features/search/domain/usecase/search_use_case.dart';
import 'package:clean_architecture_bookly/features/search/presention/manager/search_cubit.dart';
import 'package:clean_architecture_bookly/features/search/presention/view/search_view.dart';
import 'package:clean_architecture_bookly/features/splash/presentaion/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter{

  static String kHome = '/home';
  static String kBookDetails = '/bookDetails';
  static String kSearch = '/search';

  static final GoRouter router = GoRouter(
    routes:[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: kHome,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path:kBookDetails,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context)=> SimilarBooksCubit(FetchSimilarBooksUseCase(instance.get<HomeRepoImpl>())),
              child: BookDetailsView(book: state.extra as BookEntity ,));
        },
      ),
      GoRoute(
        path:kSearch,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SearchBooksCubit(
                FetchSearchBooksUseCase(instance.get<SearchRepoImpl>())),
              child: const SearchView());
        },
      ),
    ],
  );
}

