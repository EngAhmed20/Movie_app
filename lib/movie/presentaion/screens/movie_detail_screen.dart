import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean/core/utils/service_locator.dart';
import 'package:movie_clean/movie/presentaion/controller/movie_details_bloc.dart';
import '../../domain/use_case/get_movie_details_use_case.dart';
import '../../domain/use_case/get_recoomendation_use_case.dart';
import '../widgets/movie_details_content.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>getIt<MovieDetailsBloc>()
      ..add(getMovieDetailsEvent(id))
      ..add(GetMovieRecomindationEvent(id)),
    lazy: false,
    child: Scaffold(
      body: MovieDetailContent(),
    )
    ,
    );
  }
}

