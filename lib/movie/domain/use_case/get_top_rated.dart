import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/use_case/base_usecase.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repo.dart';

class GetTopRatedUseCase extends BaseUseCase<List<Movie>,NoParmeters>{
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParmeters parmeters) async{
    return await baseMoviesRepository.getTopRatedMovies();

  }
}