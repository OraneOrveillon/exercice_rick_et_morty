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
              return Scaffold(
                appBar: AppBar(),
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is EpisodeLoadedState) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(state.episode.episode),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Expanded(
                    child: DefaultTextStyle(
                      style: const TextStyle(fontSize: 20),
                      child: ListView(
                        children: [
                          Text('Name : ${state.episode.name}'),
                          const SizedBox(height: 10),
                          Text('Date of release : ${state.episode.airDate}'),
                        ],
                      ),
                    ),
                  ),
                ),
              );
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
