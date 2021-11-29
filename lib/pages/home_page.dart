import 'package:flutter/material.dart';
import 'package:lab5/model/movie.dart';
import 'package:lab5/model/movie_bloc.dart';
import 'package:provider/provider.dart';
import 'favorite_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<MovieBloc>(context);

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LikedMoviesPage()),
                );
              },
              child: const Icon(
                Icons.favorite,
                size: 30.0,
              ),
            ),
          )
        ],
        backgroundColor: Colors.deepPurple.shade200,
        title: const Text("Random movie",
            style: TextStyle(color: Colors.white, fontSize: 26),
            textAlign: TextAlign.center),
      ),
      body: Center(
        child: StreamBuilder<Movie>(
            stream: _bloc.currentMovie,
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Column(
                  children: <Widget>[
                    Image.network(
                      snapshot.data!.image,
                      scale: 0.55,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        snapshot.data!.fullTitle,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Rating: ${snapshot.data!.imDbRating}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: const Buttons(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<MovieBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              _bloc.skip();
            },
            child: const Text('Skip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(140, 35),
              primary: Colors.grey.shade600,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _bloc.addToFavorites();
            },
            child: const Text('Add to favorites',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(140, 35),
              primary: Colors.green.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
