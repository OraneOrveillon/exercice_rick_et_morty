import 'package:exercice_rick_et_morty/data/repository/characters_repository.dart';
import 'package:exercice_rick_et_morty/presentation/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: RepositoryProvider(
        create: (context) => CharactersRepository(),
        child: const CharactersPage(),
      ),
    );
  }
}
