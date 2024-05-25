
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean/core/utils/service_locator.dart';
import 'package:movie_clean/movie/domain/use_case/get_popular.dart';
import 'package:movie_clean/movie/domain/use_case/get_top_rated.dart';
import 'package:movie_clean/movie/presentaion/controller/movie_event.dart';
import 'package:movie_clean/movie/presentaion/controller/movie_state.dart';
import 'package:movie_clean/movie/presentaion/controller/movies_bloc.dart';
import '../../domain/use_case/get_now_playing.dart';
import '../widgets/main_movie_scr.dart';

class MovieScr extends StatelessWidget {
  const MovieScr({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoviesBloc>()
        ..add(
          GetNowPlayingMoviesEvent(),
        )
        ..add(GetPopularMoviesEvent()
        )..add(GetTopRatedMoviesEvent()),
      child: Scaffold(

        backgroundColor: Colors.grey.shade900,
        body: MainMoviesScreen(),
      ),
    );
  }
}
