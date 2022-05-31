import 'package:exercice_rick_et_morty/data/model/characters_model.dart';
import 'package:http/http.dart' as http;

class CharactersRepository {
  static const String _url = "https://rickandmortyapi.com/api/character";

  Future<RickMortyCharacters> getHttp() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return bodyFromMap(response.body);
    } else {
      throw Exception("Failed to load characters");
    }
  }
}
