class ApiConstants {
  static const baseUrl = "https://api.themoviedb.org/3/";
  static const apiKey = "255c6946730a81f49624b6292ac700a2";

  static const nowPlayingPath = "${baseUrl}movie/now_playing?api_key=$apiKey";
  static const popularMoviesPath = "${baseUrl}movie/popular?api_key=$apiKey";
  static const topRatedMoviesPath = "${baseUrl}movie/top_rated?api_key=$apiKey";
}
