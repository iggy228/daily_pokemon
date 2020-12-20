import 'package:flutter/material.dart';
import 'package:flutter_animation/widgets/main_card.dart';

class Home extends StatelessWidget {
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
      body: Column(
        children: [
          MainCard(),
        ],
      ),
    );
  }
}
