import 'package:flutter/material.dart';
import 'package:flutter_animation/service/pokeapi.dart';
import 'package:flutter_animation/widgets/header_grid_view.dart';
import 'package:flutter_animation/widgets/main_card.dart';
import 'package:flutter_animation/widgets/pokemon_box.dart';

class Home extends StatelessWidget {
  Future<void> goToDetails(BuildContext context, String name, String imageUrl) async {
    PokeApi pokeApi = PokeApi();
    Map pokemon = await pokeApi.getPokemonData(name);
    pokemon['imageUrl'] = imageUrl;
    Navigator.pushNamed(context, '/details', arguments: pokemon);
  }

  @override
  Widget build(BuildContext context) {
    Map pokemonsData = ModalRoute.of(context).settings.arguments;

    List pokemons = pokemonsData['pokemonsData'];
    Map todayPokemon = pokemonsData['todayPokemon'];

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text('Daily Pokemons'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            iconSize: 32,
          ),
        ],
      ),
      body: SafeArea(
        child: HeaderGridView(
          header: GestureDetector(
            onTap: () => goToDetails(context, todayPokemon['name'], todayPokemon['imageUrl']),
            child: MainCard(
              name: todayPokemon['name'],
              text: todayPokemon['description'],
              image: todayPokemon['imageUrl'],
            ),
          ),
          itemCount: pokemons.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => goToDetails(context, pokemons[index]['name'], pokemons[index]['imageUrl']),
              child: PokemonBox(
                name: pokemons[index]['name'],
                imageUrl: pokemons[index]['imageUrl'],
              ),
            );
          },
        ),
      ),
    );
  }
}
