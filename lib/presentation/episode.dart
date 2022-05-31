import 'package:exercice_rick_et_morty/bloc/episode/episode_bloc.dart';
import 'package:exercice_rick_et_morty/data/repository/episode_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EpisodeBloc(
        RepositoryProvider.of<EpisodeRepository>(context),
      )..add(LoadEpisodeEvent()),
      child: Scaffold(
        body: BlocBuilder<EpisodeBloc, EpisodeState>(
          builder: (context, state) {
            if (state is EpisodeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is EpisodeLoadedState) {
              return Text(state.episode.name);
            }
            if (state is EpisodeErrorState) {
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
