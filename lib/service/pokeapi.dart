import 'dart:convert';
import 'package:http/http.dart';

class PokeApi {
  final String baseUrl = 'https://pokeapi.co/api/v2/pokemon/';
  List pokemons;

  Future<void> getData({int offset = 0, int limit = 50}) async {
    try {
      Response response = await get('$baseUrl?offset=$offset&limit=$limit');

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        pokemons = data['results'];
        for (int i = 0; i < pokemons.length; i++) {
          Response pokemonResponse = await get('$baseUrl${pokemons[i]['name']}');
          Map pokemonData = jsonDecode(pokemonResponse.body);
          pokemons[i]['imageUrl'] = pokemonData['sprites']['other']['official-artwork']['front_default'];
        }
      }
    }
    catch (e) {
      print('Error is: $e');
    }
  }

  Future<Map> getPokemonData(String name) async {
    Response response = await get('$baseUrl$name');
    Response speciesResponse = await get('https://pokeapi.co/api/v2/pokemon-species/$name');

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      Map speciesDetails = jsonDecode(speciesResponse.body);
      Map pokemonData = {};

      pokemonData['name'] = name;
      pokemonData['stats'] = data['stats'];
      pokemonData['types'] = data['types'];
      pokemonData['description'] = speciesDetails['flavor_text_entries'][0]['flavor_text'];
      pokemonData['imageUrl'] = data['sprites']['other']['official-artwork']['front_default'];

      return pokemonData;
    }

    return {};
  }
}