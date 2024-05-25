part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? moviedetails;
  final RequestState movieDetailsState;
  final String Msg;
  final List<Recommendation> recommendationsList;
  final RequestState recommendationsListState;
  final String recommendationMsg;

  const MovieDetailsState({this.moviedetails,
    this.movieDetailsState = RequestState.loading,
    this.Msg = '',
    this.recommendationsList = const [],
    this.recommendationsListState = RequestState.loading,
    this.recommendationMsg = ''
  });

  MovieDetailsState copyWith({
    MovieDetail? moviedetails,
    RequestState? movieDetailsState,
    String? Msg,
    List<Recommendation>? recommendationsList,
    RequestState? recommendationsListState,
    String? recommendationMsg,


  }) =>
      MovieDetailsState(
          moviedetails: moviedetails ?? this.moviedetails,
          movieDetailsState: movieDetailsState ?? this.movieDetailsState,
          Msg: Msg ?? this.Msg,
          recommendationsList: recommendationsList ?? this.recommendationsList,
          recommendationsListState: recommendationsListState ??
              this.recommendationsListState,
          recommendationMsg: recommendationMsg ?? this.recommendationMsg

      );

  @override
  List<Object?> get props =>
      [
        moviedetails,
        movieDetailsState,
        Msg,
        recommendationsList,
        recommendationsListState,
        recommendationMsg,
      ];
}
