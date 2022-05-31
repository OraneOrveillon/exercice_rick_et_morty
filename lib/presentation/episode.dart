import 'package:exercice_rick_et_morty/bloc/rick_morty_bloc.dart';
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
      create: (context) => RickMortyBloc(
        RepositoryProvider.of<CharactersRepository>(context),
      )..add(LoadRickMortyEvent()),
      child: Scaffold(
        body: BlocBuilder<RickMortyBloc, RickMortyState>(
          builder: (context, state) {
            if (state is RickMortyLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is RickMortyLoadedState) {
              // return Text(state.rickMorty.);
            }
            if (state is RickMortyErrorState) {
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
