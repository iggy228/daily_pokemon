import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

        ],
      ),
    );
  }
}
