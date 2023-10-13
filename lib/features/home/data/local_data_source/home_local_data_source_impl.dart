
import 'package:clean_architecture_bookly/core/utils/constants_manager.dart';
import 'package:clean_architecture_bookly/features/home/data/local_data_source/home_local_data_source.dart';
import 'package:clean_architecture_bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource{

  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber=0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box= Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if(startIndex >= length || endIndex>length)
    {
      return [];
    }
    return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber=0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box= Hive.box<BookEntity>(kNewestBox);
    int length = box.values.length;

    if(startIndex >= length || endIndex>length)
    {
      return [];
    }

    return box.values.toList().sublist(startIndex,endIndex);
  }



  @override
  List<BookEntity> fetchSimilarBooks() {

    var box= Hive.box<BookEntity>(kSimilarBox);

    return box.values.toList();
  }
}