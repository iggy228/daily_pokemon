import 'package:flutter/material.dart';
import 'package:flutter_animation/screen/home.dart';
import 'package:flutter_animation/screen/loading.dart';
import 'package:flutter_animation/screen/pokemon_details.dart';

void main() => runApp(DailyPokemons());

class DailyPokemons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/details': (context) => PokemonDetails()
      },
      theme: ThemeData(
        primaryColor: Color.fromRGBO(30, 30, 36, 1),
        accentColor: Color.fromRGBO(119, 134, 127, 1),

        fontFamily: 'Pacifico',

        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 36,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 32,
            color: Color.fromRGBO(30, 30, 36, 1),
          ),
          headline3: TextStyle(
            fontSize: 24,
            color: Color.fromRGBO(30, 30, 36, 1),
          ),
          headline5: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.3,
            fontStyle: FontStyle.normal,
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
    );
  }
}
