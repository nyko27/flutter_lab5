import 'dart:async';
import 'package:lab5/model/movie.dart';
import 'movie_api.dart';

class MovieBloc {
  MovieBloc() {
    _nextMovie();
  }

  Movie? _currentMovie;
  final List<Movie> _likedMovies = [];

  final Future<List<Movie>> _allMoviesFuture = getMovies();
  final _currentMovieController = StreamController<Movie>.broadcast();

  Stream<Movie> get currentMovie => _currentMovieController.stream;
  List<Movie> get likedMovies => _likedMovies;

  void _nextMovie() async {
    _currentMovie = (await _allMoviesFuture).removeLast();
    _currentMovieController.add(_currentMovie!);
  }

  void addToFavorites() async {
    setFavorites();
    _nextMovie();
  }

  void skip() {
    _nextMovie();
  }

  void setFavorites() async {
    _likedMovies.add(_currentMovie!);
  }

  static Future<List<Movie>> getMovies() async {
    final movies = await fetchTopMovies();
    movies.shuffle();
    return movies;
  }
}
