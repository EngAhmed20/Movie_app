import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean/core/use_case/base_usecase.dart';
import 'package:movie_clean/core/utils/enums.dart';
import 'package:movie_clean/movie/domain/use_case/get_now_playing.dart';
import 'package:movie_clean/movie/presentaion/controller/movie_state.dart';

import '../../domain/use_case/get_popular.dart';
import '../../domain/use_case/get_top_rated.dart';
import 'movie_event.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularUseCase getPopularUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;

  MoviesBloc(this.getNowPlayingUseCase, this.getPopularUseCase,
      this.getTopRatedUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRated);
  }
  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingUseCase.call(NoParmeters());
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, NowPlayingMsg: l.message)),
        (r) => emit(state.copyWith(
            nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularUseCase.call(NoParmeters());
    result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMsg: l.message)),
        (r) => emit(state.copyWith(
            popularMovies: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRated(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedUseCase.call(NoParmeters());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedMsg: l.message,
        ),
      ),
      (r) => emit(state.copyWith(
          topRatedMovies: r, topRatedState: RequestState.loaded)),
    );
  }

}
