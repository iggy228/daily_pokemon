import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  HeaderCard({this.imageUrl, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Hero(
        tag: 'pokemon-$name',
        child: Image.asset(
          imageUrl,
          height: 200,
        ),
      ),
    );
  }
}
