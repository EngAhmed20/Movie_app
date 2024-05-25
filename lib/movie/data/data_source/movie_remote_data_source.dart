import 'package:dio/dio.dart';
import 'package:movie_clean/core/error/exceptions.dart';
import 'package:movie_clean/core/network/api_constance.dart';
import 'package:movie_clean/core/network/error_msg_model.dart';
import 'package:movie_clean/movie/data/models/movie_model.dart';
import 'package:movie_clean/movie/data/models/recommendation_model.dart';

import '../../domain/use_case/get_movie_details_use_case.dart';
import '../../domain/use_case/get_recoomendation_use_case.dart';
import '../models/movie_details_model.dart';
abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>>getNowPlayingMovies();
  Future<List<MovieModel>>getPopularMovies();
  Future<List<MovieModel>>getTopRatedMovies();
  Future<MovieDetailsModel>getMovieDetails(movieDetailsParmeters parameters);
  Future<List<RecommendationModel>>getRecommendationMovies(RecommendationParameters parameters);

}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  Future<List<MovieModel>>getNowPlayingMovies()async{
    final response=await Dio().get(
       ApiConctance.nowPlayingMoviesPath);
    if(response.statusCode==200)
      {
        return List<MovieModel>.from((response.data['results']as List).map((e) =>MovieModel.fromJson(e)));

      }else{
      throw  ServerException(ErrorMsgModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
   var response=await Dio().get(ApiConctance.popularMoviesPath);
   if(response.statusCode==200)
     {
       return List<MovieModel>.from((response.data['results'] as List).map((e) =>MovieModel.fromJson(e)));

     }else{
     throw ServerException(ErrorMsgModel.fromJson(response.data));
   }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
   var response =await Dio().get(ApiConctance.topRatingMoviesPath);
   if(response.statusCode==200){
     return List<MovieModel>.from((response.data['results'] as List).map((e) =>MovieModel.fromJson(e)));
   }else{
     throw ServerException(ErrorMsgModel.fromJson(response.data));

   }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(movieDetailsParmeters parameters) async{
    var response=await Dio().get(ApiConctance.movieDetailsPath(parameters.movieId));
    if(response.statusCode==200)
      {
        return MovieDetailsModel.fromJson(response.data);
      }
    else{
      throw ServerException(ErrorMsgModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(RecommendationParameters parameters)async {
    var response=await Dio().get(ApiConctance.movieRecommendationPath(parameters.id));
    if(response.statusCode==200)
      {
        return List<RecommendationModel>.from((response.data['results'] as List).map((e) =>RecommendationModel.fromJson(e)));
      }
    else{
      throw ServerException(ErrorMsgModel.fromJson(response.data));
    }
  }
}