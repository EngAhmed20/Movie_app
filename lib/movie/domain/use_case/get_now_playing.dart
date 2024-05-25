import 'package:dartz/dartz.dart';
import 'package:movie_clean/core/use_case/base_usecase.dart';
import 'package:movie_clean/movie/domain/repository/base_movie_repo.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetNowPlayingUseCase extends BaseUseCase<List<Movie>,NoParmeters>{
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParmeters parmeters) async{
    return await baseMoviesRepository.getNowPlayingMovies();

  }
}