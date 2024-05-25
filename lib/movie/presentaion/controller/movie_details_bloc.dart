import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean/movie/domain/entities/movie_details.dart';
import 'package:movie_clean/movie/domain/use_case/get_movie_details_use_case.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/use_case/get_recoomendation_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(MovieDetailsState()) {
    on<getMovieDetailsEvent>(_getMovieDetailsEvent);
    on<GetMovieRecomindationEvent>(_getMovieRecomindationEvent);
  }
  FutureOr<void> _getMovieDetailsEvent(
      getMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase
        .call(movieDetailsParmeters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              Msg: l.message,
            )),
        (r) => emit(
              state.copyWith(
                movieDetailsState: RequestState.loaded,
                moviedetails: r,
              ),
            ));
  }

  FutureOr<void> _getMovieRecomindationEvent(
      GetMovieRecomindationEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase
        .call(RecommendationParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              recommendationsListState: RequestState.error,
              recommendationMsg: l.message,
            )),
        (r) => emit(state.copyWith(
            recommendationsListState: RequestState.loaded,
            recommendationsList: r)));
  }
}
