import 'package:flutter/material.dart';
import 'package:lab5/model/movie_bloc.dart';
import 'package:provider/provider.dart';

class LikedMoviesPage extends StatelessWidget {
  const LikedMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<MovieBloc>(context);
    List<String> liked = [];
    if (_bloc.likedMovies.isEmpty) {
      liked.add("No liked movies yet");
    } else {
      liked = _bloc.likedMovies.map((movie) => movie.fullTitle).toList();
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        title: const Center(
          child: Text("Liked movies",
              style: TextStyle(color: Colors.white, fontSize: 26),
              textAlign: TextAlign.center),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ...liked.map((title) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      ),
    );
  }
}
