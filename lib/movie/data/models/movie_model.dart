import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.voteAvg,
      required super.genreIds,
      required super.overview,
      required super.releaseDate,
      required super.voteCount});

  factory MovieModel.fromJson(Map<String,dynamic>json)=>MovieModel(
      id: json['id'],
      title: json['original_title'],
      backdropPath: json['backdrop_path'],
      voteAvg: json['vote_average'],
      genreIds: List<int>.from(json['genre_ids'].map((e)=>e)),
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteCount: json['vote_count'].toDouble(),
  );
}
