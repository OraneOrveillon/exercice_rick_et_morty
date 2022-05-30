import 'package:exercice_rick_et_morty/data/model/rick_morty_model.dart';
import 'package:http/http.dart' as http;

class RickMortyRepository {
  static const String _characters = "https://rickandmortyapi.com/api/character";

  Future<RickMorty> getCharacters() async => _getHttp(_characters, "characters");

  Future<RickMorty> getEpisode(String episodeUrl) async => _getHttp(episodeUrl, "episode");

  Future<RickMorty> _getHttp(String url, String exception) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return bodyFromMap(response.body);
    } else {
      throw Exception("Failed to load $exception");
    }
  }
}
