import 'package:dartz/dartz.dart';
import 'package:movie_clean/core/error/exceptions.dart';
import 'package:movie_clean/core/error/failure.dart';
import 'package:movie_clean/movie/domain/entities/movie.dart';
import 'package:movie_clean/movie/domain/entities/movie_details.dart';
import 'package:movie_clean/movie/domain/entities/recommendation.dart';
import 'package:movie_clean/movie/domain/repository/base_movie_repo.dart';
import 'package:movie_clean/movie/domain/use_case/get_movie_details_use_case.dart';
import 'package:movie_clean/movie/domain/use_case/get_recoomendation_use_case.dart';

import '../../../core/network/error_msg_model.dart';
import '../../../core/network/error_msg_model.dart';
import '../data_source/movie_remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepository{
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies() async{
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMsgModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async{
   final result = await baseMovieRemoteDataSource.getPopularMovies();
   try{
     return Right(result);
   }on ServerException catch(failure){
     return Left(ServerFailure(failure.errorMsgModel.message));

   }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async{
    final result=await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMsgModel.message));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(movieDetailsParmeters parmeters) async{
    final result =await baseMovieRemoteDataSource.getMovieDetails(parmeters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMsgModel.message));
    }

  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parmeters) async{
   final result =await baseMovieRemoteDataSource.getRecommendationMovies(parmeters);
   try{
     return Right(result);
   }on ServerException catch(failure){
     return Left(ServerFailure(failure.errorMsgModel.message));
   }
  }



}