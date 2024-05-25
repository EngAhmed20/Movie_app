import 'package:equatable/equatable.dart';
import 'package:movie_clean/movie/domain/entities/movie.dart';

import '../../../core/utils/enums.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String NowPlayingMsg;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMsg;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMsg;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.NowPlayingMsg = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMsg = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMsg = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? NowPlayingMsg,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMsg,
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMsg,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      NowPlayingMsg: NowPlayingMsg ?? this.NowPlayingMsg,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMsg: popularMsg ?? this.popularMsg,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMsg: topRatedMsg ?? this.topRatedMsg,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        NowPlayingMsg,
        popularMovies,
        popularState,
        popularMsg,
        topRatedMovies,
        topRatedState,
        topRatedMsg,
      ];
}
