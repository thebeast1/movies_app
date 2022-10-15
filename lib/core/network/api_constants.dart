class ApiConstants {
  static const baseUrl = "https://api.themoviedb.org/3/";
  static const apiKey = "255c6946730a81f49624b6292ac700a2";

  static const nowPlayingPath = "${baseUrl}movie/now_playing?api_key=$apiKey";
  static const popularMoviesPath = "${baseUrl}movie/popular?api_key=$apiKey";
  static const topRatedMoviesPath = "${baseUrl}movie/top_rated?api_key=$apiKey";

    static String movieDetailsPath(int movieId) =>
      "${baseUrl}movie/$movieId?api_key=$apiKey";

  static String recommendationPath(int movieId) =>
      "${baseUrl}movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
