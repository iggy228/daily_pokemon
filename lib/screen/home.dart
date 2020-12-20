import 'package:flutter/material.dart';
import 'package:flutter_animation/models/PokemonBasic.dart';
import 'package:flutter_animation/widgets/header_grid_view.dart';
import 'package:flutter_animation/widgets/main_card.dart';
import 'package:flutter_animation/widgets/pokemon_box.dart';

class Home extends StatelessWidget {
  List<PokemonBasic> pokemons = [
    PokemonBasic('Pikashu', 'pikashu.jpg'),
    PokemonBasic('Fennekin', 'fennekin.png'),
    PokemonBasic('Squirtle', 'squirtle.jpg'),
    PokemonBasic('Eevee', 'eevee.jpg'),
    PokemonBasic('Dedenne', 'dedenne.webp'),
    PokemonBasic('Scorbunny', 'scorbunny.jpg'),
    PokemonBasic('Psyduck', 'psyduck.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
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
            onTap: () {},
            child: MainCard(
              name: 'Fennekin',
              text: 'There is lot of text about fennekin uwu',
              image: 'images/fennekin.png',
            ),
          ),
          itemCount: pokemons.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: PokemonBox(
                name: pokemons[index].name,
                image: pokemons[index].image,
              ),
            );
          },
        ),
      ),
    );
  }
}
