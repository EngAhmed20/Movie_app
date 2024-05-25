class ApiConctance{
static const String baseUrl="https://api.themoviedb.org/3/";
static const String apiKey="7bc228c5d04aa9e7c8d1ddae5084fcb9";
static const String nowPlayingMoviesPath="${baseUrl}movie/now_playing?api_key=${apiKey}";
static const String popularMoviesPath="${baseUrl}movie/popular?api_key=${apiKey}";
static const String topRatingMoviesPath="${baseUrl}movie/top_rated?api_key=${apiKey}";
static const String baseImgUrl='https://image.tmdb.org/t/p/w500';
static String imgUrl(String path)=>'$baseImgUrl$path';
static  String movieDetailsPath(int movieId)=>'${baseUrl}movie/${movieId}?api_key=${apiKey}';
static String movieRecommendationPath(int movieId)=>'${baseUrl}movie/${movieId}/recommendations?api_key=${apiKey}';



}