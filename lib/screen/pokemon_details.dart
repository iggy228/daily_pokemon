import 'package:flutter/material.dart';
import 'package:flutter_animation/widgets/header_card.dart';
import 'package:flutter_animation/widgets/pokemon_details_list_view.dart';
import 'package:flutter_animation/widgets/stat_indicator.dart';
import 'package:flutter_animation/widgets/type_card.dart';

class PokemonDetails extends StatelessWidget {

  final Map<String, Color> typeToColor = {
    'normal': Colors.grey[500],
    'fire': Colors.redAccent,
    'water': Colors.blue,
    'grass': Colors.lightGreen,
    'electric': Colors.yellow,
    'ice': Colors.lightBlue,
    'fighting': Colors.red,
    'poison': Colors.deepPurple,
    'ground': Colors.brown,
    'flying': Colors.lightBlueAccent,
    'psychic': Colors.pinkAccent,
    'bug': Colors.green,
    'rock': Colors.grey[800],
    'ghost': Colors.blueGrey,
    'dark': Colors.black,
    'dragon': Colors.deepOrange,
    'steel': Colors.grey[300],
    'fairy': Colors.pink,
  };

  final List statDetails = [
    ['images/health.png', Colors.red[800]],
    ['images/attack.png', Colors.red],
    ['images/defense.png', Colors.blue],
    ['images/special_attack.png', Colors.purple[800]],
    ['images/special_defense.png', Colors.blue[800]],
    ['images/speed.png', Colors.green[800]],
  ];

  @override
  Widget build(BuildContext context) {
    Map pokemon = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: PokemonDetailsListView(
          header: HeaderCard(
            name: pokemon['name'],
            imageUrl: pokemon['imageUrl'],
          ),
          title: Text(
            pokemon['name'],
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          description: Text(pokemon['description']),
          rowListView: SizedBox(
            height: 40,
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: pokemon['types'].length,
                itemBuilder: (_, int i) {
                  return TypeCard(
                    pokemon['types'][i]['type']['name'],
                    color: typeToColor[pokemon['types'][i]['type']['name']],
                  );
                },
              ),
            ),
          ),
          itemCount: statDetails.length,
          itemBuilder: (_, int i) {
            return StatIndicator(
              imageUrl: statDetails[i][0],
              color: statDetails[i][1],
              value: pokemon['stats'][i]['base_stat'].toDouble(),
            );
          },
        ),
      ),
    );
  }
}
