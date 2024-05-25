import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_clean/core/network/api_constance.dart';
import 'package:movie_clean/core/utils/app_string.dart';
import 'package:movie_clean/movie/presentaion/widgets/popular_component.dart';
import 'package:movie_clean/movie/presentaion/widgets/top_rated_component.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/test_list.dart';
import 'now_playing_component.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const Key('movieScrollView'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NowPlayingComponent(),
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.popular,
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: 0.15,
                  ),
                ),
                InkWell(
                  onTap: () {
                    /// TODO : NAVIGATION TO POPULAR SCREEN
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(AppString.seeMore,style: TextStyle(color: Colors.white),),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          PopularComponent(),
          Container(
            margin: const EdgeInsets.fromLTRB(
              16.0,
              24.0,
              16.0,
              8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.topRated,
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    /// TODO : NAVIGATION TO Top Rated Movies Screen
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(AppString.seeMore,style: TextStyle(color: Colors.white),),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          TopRatedComponent(),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
