import 'package:exercice_rick_et_morty/data/model/episode_model.dart';
import 'package:http/http.dart' as http;

class EpisodeRepository {
  EpisodeRepository({required this.url});

  final String url;

  Future<RickMortyEpisode> getHttp() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return bodyFromMap(response.body);
    } else {
      throw Exception("Failed to load episode");
    }
  }
}
