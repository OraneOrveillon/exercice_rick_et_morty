import 'package:exercice_rick_et_morty/bloc/rick_morty_bloc.dart';
import 'package:exercice_rick_et_morty/data/repository/rick_morty_repository.dart';
import 'package:exercice_rick_et_morty/presentation/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RickMortyBloc(
        RepositoryProvider.of<RickMortyRepository>(context),
      )..add(LoadRickMortyEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rick & Morty : characters'),
        ),
        body: BlocBuilder<RickMortyBloc, RickMortyState>(
          builder: (context, state) {
            if (state is RickMortyLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is RickMortyLoadedState) {
              return ListView.separated(
                itemCount: state.rickMorty.results.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(state.rickMorty.results[index].image),
                    ),
                    tileColor: Colors.indigo[100],
                    hoverColor: Colors.indigo[200],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    title: Text(state.rickMorty.results[index].name),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Character(character: state.rickMorty.results[index]),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
              );
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
