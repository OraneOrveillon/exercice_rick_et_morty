import 'package:exercice_rick_et_morty/data/model/characters_model.dart';
import 'package:http/http.dart' as http;

class CharactersRepository {
  static const String _characters = "https://rickandmortyapi.com/api/character";

  Future<RickMortyCharacters> getCharacters() async => _getHttp(_characters, "characters");

  Future<RickMortyCharacters> getEpisode(String episodeUrl) async => _getHttp(episodeUrl, "episode");

  Future<RickMortyCharacters> _getHttp(String url, String exception) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return bodyFromMap(response.body);
    } else {
      throw Exception("Failed to load $exception");
    }
  }
}
