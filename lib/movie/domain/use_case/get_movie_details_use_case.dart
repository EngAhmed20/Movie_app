import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_clean/core/error/failure.dart';
import 'package:movie_clean/core/use_case/base_usecase.dart';
import 'package:movie_clean/movie/domain/entities/movie_details.dart';

import '../repository/base_movie_repo.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail,movieDetailsParmeters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(movieDetailsParmeters parmeters) async{
    return await baseMoviesRepository.getMovieDetails(parmeters);
  }

}
class movieDetailsParmeters extends Equatable{
  final int movieId;
  const movieDetailsParmeters({required this.movieId});
  @override
  // TODO: implement props
  List<Object?> get props => [id];

}