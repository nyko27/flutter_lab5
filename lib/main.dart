import 'package:flutter/material.dart';
import 'package:lab5/model/movie_bloc.dart';
import 'package:provider/provider.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => MovieBloc(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
