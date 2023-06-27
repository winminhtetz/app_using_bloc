import 'package:app_using_bloc/bloc/get/cubit/get_post_cubit.dart';
import 'package:app_using_bloc/data/api/api_service.dart';
import 'package:app_using_bloc/data/post_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

var getIt = GetIt.I;

void locator() {
  Dio dio = Dio();

  getIt.registerLazySingleton(() => dio);

  ApiService apiService = ApiService(getIt.call());
  getIt.registerLazySingleton(() => apiService);

  PostRepo postRepo = PostRepo(apiService);
  getIt.registerLazySingleton(() => postRepo);

  GetPostCubit getPostCubit = GetPostCubit(getIt.call());
  getIt.registerLazySingleton(() => getPostCubit);
}
