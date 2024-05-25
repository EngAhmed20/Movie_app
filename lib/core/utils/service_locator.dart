import 'package:get_it/get_it.dart';
import 'package:movie_clean/movie/data/data_source/movie_remote_data_source.dart';
import 'package:movie_clean/movie/data/repository/movies_repo.dart';
import 'package:movie_clean/movie/domain/repository/base_movie_repo.dart';
import 'package:movie_clean/movie/domain/use_case/get_movie_details_use_case.dart';
import 'package:movie_clean/movie/domain/use_case/get_popular.dart';
import 'package:movie_clean/movie/domain/use_case/get_recoomendation_use_case.dart';
import 'package:movie_clean/movie/domain/use_case/get_top_rated.dart';
import 'package:movie_clean/movie/presentaion/controller/movie_details_bloc.dart';
import 'package:movie_clean/movie/presentaion/controller/movie_event.dart';
import 'package:movie_clean/movie/presentaion/controller/movies_bloc.dart';
import 'package:movie_clean/movie/presentaion/screens/movie_scr.dart';

import '../../movie/domain/use_case/get_now_playing.dart';

final getIt = GetIt.instance;

class ServicesLoacator
{
  void init(){
    getIt.registerFactory(() => MoviesBloc(getIt(),getIt(),getIt()));
    getIt.registerFactory(() =>MovieDetailsBloc(getIt(),getIt()));
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() =>MovieRemoteDataSource());
    getIt.registerLazySingleton<BaseMoviesRepository>(() =>MoviesRepository(getIt()));
    ///usecase
    getIt.registerLazySingleton<GetNowPlayingUseCase>(() => GetNowPlayingUseCase(getIt()));
    getIt.registerLazySingleton<GetPopularUseCase>(()=>GetPopularUseCase(getIt()));
    getIt.registerLazySingleton<GetTopRatedUseCase>(() =>GetTopRatedUseCase(getIt()));
    getIt.registerLazySingleton<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(getIt()));
    getIt.registerLazySingleton<GetRecommendationUseCase>(() => GetRecommendationUseCase(getIt()));



  }

}