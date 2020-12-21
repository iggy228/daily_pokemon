import 'package:flutter/material.dart';
import 'package:flutter_animation/screen/home.dart';
import 'package:flutter_animation/screen/pokemon_details.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => Home(),
    '/details': (context) => PokemonDetails()
  },
  theme: ThemeData(
    primaryColor: Color.fromRGBO(30, 30, 36, 1),
    accentColor: Color.fromRGBO(119, 134, 127, 1),

    fontFamily: 'OpenSans',

    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 36,
        fontFamily: 'Pacifico',
        color: Colors.white,
      ),
      headline2: TextStyle(
        fontSize: 32,
        fontFamily: 'Pacifico',
        color: Color.fromRGBO(30, 30, 36, 1),
      ),
      headline3: TextStyle(
        fontSize: 24,
        fontFamily: 'Pacifico',
        color: Color.fromRGBO(30, 30, 36, 1),
      ),
      bodyText1: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 14,
      ),
      bodyText2: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 14,
        letterSpacing: 2,
        color: Colors.white,
      ),
    ),
  ),
));