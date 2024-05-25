import 'package:dartz/dartz.dart';
import 'package:movie_clean/movie/domain/entities/movie_details.dart';
import 'package:movie_clean/movie/domain/entities/recommendation.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../use_case/get_movie_details_use_case.dart';
import '../use_case/get_recoomendation_use_case.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetail>> getMovieDetails(movieDetailsParmeters parameters);
  Future<Either<Failure,List<Recommendation>>> getRecommendation(RecommendationParameters parameters);

}