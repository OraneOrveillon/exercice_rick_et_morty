import 'package:exercice_rick_et_morty/bloc/characters/characters_bloc.dart';
import 'package:exercice_rick_et_morty/data/repository/characters_repository.dart';
import 'package:exercice_rick_et_morty/presentation/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersBloc(
        RepositoryProvider.of<CharactersRepository>(context),
      )..add(LoadCharactersEvent()),
      child: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoadingState) {
            return Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is CharactersLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Rick & Morty : characters'),
                leading: const Icon(Icons.info, color: Colors.indigo),
                actions: [
                  IconButton(
                    onPressed: () {
                      if (state.rickMorty.info.prev != null) {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: RepositoryProvider(
                              create: (context) => CharactersRepository(pageUrl: state.rickMorty.info.prev),
                              child: const CharactersPage(),
                            ),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  IconButton(
                    onPressed: () {
                      if (state.rickMorty.info.next != null) {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: RepositoryProvider(
                              create: (context) => CharactersRepository(pageUrl: state.rickMorty.info.next),
                              child: const CharactersPage(),
                            ),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
              body: ListView.separated(
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
              ),
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
    );
  }
}
