import 'package:flutter/material.dart';
import 'package:flutter_animation/service/pokeapi.dart';
import 'package:flutter_animation/widgets/header_grid_view.dart';
import 'package:flutter_animation/widgets/main_card.dart';
import 'package:flutter_animation/widgets/pokemon_box.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List pokemons = ModalRoute.of(context).settings.arguments;

    Future<void> goToDetails(String name) async {
      PokeApi pokeApi = PokeApi();
      Map pokemon = await pokeApi.getPokemonData(name);
      print(pokemon);
      Navigator.pushNamed(context, '/details', arguments: pokemon);
    }

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
            onTap: () => Navigator.pushNamed(context, '/details'),
            child: MainCard(
              name: 'Fennekin',
              text: 'There is lot of text about fennekin uwu',
              image: 'images/fennekin.png',
            ),
          ),
          itemCount: pokemons.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => goToDetails(pokemons[index]['name']),
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
