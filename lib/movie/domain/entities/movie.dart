import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final double voteAvg;
  final List<int>genreIds;
  final String overview;
  final String releaseDate;
  final double voteCount;
  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.voteAvg,
    required this.genreIds,
    required this.overview,
    required this.releaseDate,
    required this.voteCount,
  });
  @override
  List<Object> get props =>
      [id, title, backdropPath, voteAvg, genreIds, overview,releaseDate,voteCount];


}