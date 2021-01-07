import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';

class PokeApi {
  final String baseUrl = 'https://pokeapi.co/api/v2/pokemon/';
  List pokemons = [];
  Map todayPokemon = {};
  final int maxPokemons = 825;

  Future<void> getData({int offset = 0, int limit = 20}) async {
    try {
      Response response = await get('$baseUrl?offset=$offset&limit=$limit');

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        pokemons = data['results'];
        for (int i = 0; i < pokemons.length; i++) {
          Response pokemonResponse = await get(
              '$baseUrl${pokemons[i]['name']}');
          Map pokemonData = jsonDecode(pokemonResponse.body);
          pokemons[i]['imageUrl'] = pokemonData['sprites']['other']['official-artwork']['front_default'];
        }
      }
    }
    catch (e) {
      print('Error is: $e');
    }
  }

  Future<Map> getTodayPokemon() async {
    DateTime date = DateTime.now();
    int seed = date.day + date.month * 31 + date.year * 12;
    Random rng = Random(seed);
    int id = rng.nextInt(maxPokemons);

    Response response = await get('$baseUrl$id');
    Response speciesResponse = await get('https://pokeapi.co/api/v2/pokemon-species/$id');

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      Map speciesData = jsonDecode(speciesResponse.body);

      // flavours text
      List flavorText = speciesData['flavor_text_entries'];

      todayPokemon['name'] = data['species']['name'];
      todayPokemon['imageUrl'] = data['sprites']['other']['official-artwork']['front_default'];
      for (int i = 0; i < flavorText.length; i++) {
        if (flavorText[i]['language']['name'] == 'en') {
          todayPokemon['description'] = flavorText[i]['flavor_text'].replaceAll('\n', ' ').replaceAll('\u000c', ' ');
        }
      }
    }
  }

  Future<Map> getPokemonData(String name) async {
    Response response = await get('$baseUrl$name');
    Response speciesResponse = await get('https://pokeapi.co/api/v2/pokemon-species/$name');

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      Map speciesDetails = jsonDecode(speciesResponse.body);
      Map pokemonData = {};

      // flavours text
      List flavorText = speciesDetails['flavor_text_entries'];

      pokemonData['name'] = name;
      pokemonData['stats'] = data['stats'];
      pokemonData['types'] = data['types'];
      pokemonData['imageUrl'] = data['sprites']['other']['official-artwork']['front_default'];
      for (int i = 0; i < flavorText.length; i++) {
        if (flavorText[i]['language']['name'] == 'en') {
          pokemonData['description'] = flavorText[i]['flavor_text'].replaceAll('\n', ' ').replaceAll('\u000c', ' ');
        }
      }
      return pokemonData;
    }

    return {};
  }
}