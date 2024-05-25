part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}
class getMovieDetailsEvent extends MovieDetailsEvent {
  final int id;
  getMovieDetailsEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
class GetMovieRecomindationEvent extends MovieDetailsEvent {
  final int id;
  GetMovieRecomindationEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}