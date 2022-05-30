import 'package:exercice_rick_et_morty/data/model/rick_morty_model.dart';
import 'package:flutter/material.dart';

class Character extends StatelessWidget {
  const Character({Key? key, required this.character}) : super(key: key);

  final Result character;

  List<Widget> getEpisodes() {
    List<Widget> episodes = [];
    for (String episode in character.episode) {
      episodes.add(Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
        child: Chip(
          label: Text(episode.split('/').last),
        ),
      ));
    }
    return episodes;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> information = [
      Text('Gender : ${character.gender.toString().split('.').last}'),
      Text('Location : ${character.location.name}'),
      Text('Origin : ${character.origin.name}'),
      Text('Species : ${character.species.toString().split('.').last}'),
      Text('Status : ${character.status.toString().split('.').last}'),
      Text('Type : ${character.type != '' ? character.type : 'none'}'),
      Wrap(
        children: [
          const Text('Episodes : '),
          ...getEpisodes(),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(character.image),
                  ),
                ),
              ),
            ),
            Expanded(
              child: DefaultTextStyle(
                style: const TextStyle(fontSize: 20),
                child: ListView.separated(
                  itemBuilder: (context, index) => information[index],
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
                  itemCount: information.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
