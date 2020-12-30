import 'package:flutter/material.dart';

class TypeCard extends StatelessWidget {
  final String text;
  final Color color;

  TypeCard(this.text, {this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
