import 'package:clean_architecture_bookly/core/utils/style_manager.dart';
import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:clean_architecture_bookly/features/home/presention/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/custom_app_bar.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/featured_books_list_view_bloc_consumer.dart';
import 'package:clean_architecture_bookly/features/home/presention/views/widgets/newest_books_List_view_bloc_consumer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final ScrollController _scrollController;
  var nextPage = 1;

  bool isLoading = false;

  @override
  void initState() {
    _scrollController= ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();

  }
  void _scrollListener()async{
    double currentPosition = _scrollController.position.pixels;
    double maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLength) {
      if(!isLoading) {
        isLoading=true;
        await BlocProvider.of<NewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: const [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: AppPadding.p20),
                child: CustomAppBar(),

              ),
              FeaturedListViewBlocConsumer(),
              SizedBox(
                height: AppSize.s40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: Text(
                  'Newest Books',
                  style: Styles.testStyle18,
                ),
              ),
              SizedBox(
                height: AppSize.s20,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: NewestBooksListViewBlocConsumer(),
          )
        ),
      ],

    );
  }
}


