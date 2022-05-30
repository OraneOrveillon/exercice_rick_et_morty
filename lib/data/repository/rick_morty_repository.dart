import 'package:exercice_rick_et_morty/data/model/rick_morty_model.dart';
import 'package:http/http.dart' as http;

class RickMortyRepository {
  static const String _url = "https://rickandmortyapi.com/api/character";

  Future<RickMorty> getHttp() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      ;
      return bodyFromMap(response.body);
    } else {
      throw Exception("Failed to load characters");
    }
  }
}
