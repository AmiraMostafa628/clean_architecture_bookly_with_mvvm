import 'package:clean_architecture_bookly/core/utils/api_services.dart';
import 'package:clean_architecture_bookly/features/home/data/local_data_source/home_local_data_source_impl.dart';
import 'package:clean_architecture_bookly/features/home/data/remote_data_source/home_remote_data_source_impl.dart';
import 'package:clean_architecture_bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:clean_architecture_bookly/features/search/data/remote_data_source/search_remote_data_source_impl.dart';
import 'package:clean_architecture_bookly/features/search/data/repos/search_repos_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt instance = GetIt.instance;

void initAppModule() {

  instance.registerSingleton<ApiServices>(ApiServices(Dio()));
  instance.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(
      homeLocalDataSource:HomeLocalDataSourceImpl(),
      homeRemoteDataSource:HomeRemoteDataSourceImpl(
          instance.get<ApiServices>()
      ),
     ));

  instance.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(
        searchRemoteDataSource:SearchRemoteDataSourceImpl(
            instance.get<ApiServices>()
        ),
      ));



}