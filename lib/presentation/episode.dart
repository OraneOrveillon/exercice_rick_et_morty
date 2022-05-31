import 'package:exercice_rick_et_morty/bloc/characters/characters_bloc.dart';
import 'package:exercice_rick_et_morty/data/repository/characters_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersBloc(
        RepositoryProvider.of<CharactersRepository>(context),
      )..add(LoadCharactersEvent()),
      child: Scaffold(
        body: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            if (state is CharactersLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CharactersLoadedState) {
              // return Text(state.rickMorty.);
            }
            if (state is CharactersErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
