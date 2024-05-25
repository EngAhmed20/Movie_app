import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_clean/core/error/failure.dart';
import 'package:movie_clean/movie/domain/entities/movie.dart';

abstract class BaseUseCase<T,parmeters>{
  Future<Either<Failure,T>> call(parmeters parameters);
}
class NoParmeters extends Equatable{
  const NoParmeters();
  @override
  List<Object> get props => [];
}