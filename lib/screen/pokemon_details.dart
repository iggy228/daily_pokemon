import 'package:flutter/material.dart';
import 'package:flutter_animation/widgets/header_card.dart';
import 'package:flutter_animation/widgets/stat_indicator.dart';
import 'package:flutter_animation/widgets/type_card.dart';

class PokemonDetails extends StatelessWidget {
  final String name = 'Fennekin';
  final String image = 'images/fennekin.png';

  final List<String> types = [
    'Fire',
  ];

  final Map<String, Color> typeToColor = {
    'Normal': Colors.grey[500],
    'Fire': Colors.redAccent,
    'Water': Colors.blue,
    'Grass': Colors.lightGreen,
    'Electric': Colors.yellow,
    'Ice': Colors.lightBlue,
    'Fighting': Colors.red,
    'Poison': Colors.deepPurple,
    'Ground': Colors.brown,
    'Flying': Colors.lightBlueAccent,
    'Psychic': Colors.pinkAccent,
    'Bug': Colors.green,
    'Rock': Colors.grey[800],
    'Ghost': Colors.blueGrey,
    'Dark': Colors.black,
    'Dragon': Colors.deepOrange,
    'Steel': Colors.grey[300],
    'Fairy': Colors.pink,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderCard(
              imageUrl: image,
              name: name,
            ),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                SizedBox(height: 8),
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 40,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: types.length,
                      itemBuilder: (BuildContext context, int i) {
                        return TypeCard(types[i], color: typeToColor[types[i]]);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Stats indicator
                StatIndicator(imageUrl: 'images/health.png', color: Colors.red[800], value: 25),
                StatIndicator(imageUrl: 'images/attack.png', color: Colors.red, value: 25),
                StatIndicator(imageUrl: 'images/defense.png', color: Colors.blue, value: 50),
                StatIndicator(imageUrl: 'images/speed.png', color: Colors.green[800], value: 100),
                StatIndicator(imageUrl: 'images/special_attack.png', color: Colors.purple[800], value: 25),
                StatIndicator(imageUrl: 'images/special_defense.png', color: Colors.blue[800], value: 25),

                Text('There is lot of text about fennekin uwu')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
