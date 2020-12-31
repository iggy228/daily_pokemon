import 'package:flutter/material.dart';

class PokemonBox extends StatelessWidget {
  final String name;
  final String imageUrl;

  PokemonBox({this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            Image.network(imageUrl, width: 130),
          ],
        ),
      ),
    );
  }
}
