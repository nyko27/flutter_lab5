import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie.dart';

Future<List<Movie>> fetchTopMovies() async {
  const String imdbApiKey = "k_11tu88v2"; // max 1000 reqests per day

  var response = await http
      .get(Uri.parse('https://imdb-api.com/en/API/Top250Movies/$imdbApiKey'));

  List topMoviesData = json.decode(response.body)["items"];

  List<Movie> movies = List<Movie>.from(
      topMoviesData.map((movieData) => Movie.formJson(movieData)));

  return movies;
}
