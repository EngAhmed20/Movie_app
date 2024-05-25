import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_clean/core/error/failure.dart';
import 'package:movie_clean/core/use_case/base_usecase.dart';
import 'package:movie_clean/movie/domain/repository/base_movie_repo.dart';

import '../entities/recommendation.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>,RecommendationParameters>
{
  final BaseMoviesRepository baseMoviesRepository;
  GetRecommendationUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async{
   return await baseMoviesRepository.getRecommendation(parameters);
  }

}
class RecommendationParameters extends Equatable{
  final int id;

  const RecommendationParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props =>[id];

}