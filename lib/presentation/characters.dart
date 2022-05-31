import 'package:exercice_rick_et_morty/bloc/characters/characters_bloc.dart';
import 'package:exercice_rick_et_morty/data/repository/characters_repository.dart';
import 'package:exercice_rick_et_morty/presentation/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersBloc(
        RepositoryProvider.of<CharactersRepository>(context),
      )..add(LoadCharactersEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rick & Morty : characters'),
        ),
        body: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            if (state is CharactersLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CharactersLoadedState) {
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
                        builder: (context) => CharacterPage(character: state.rickMorty.results[index]),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
              );
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
