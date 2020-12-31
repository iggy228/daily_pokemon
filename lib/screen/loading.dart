import 'package:flutter/material.dart';
import 'package:flutter_animation/service/pokeapi.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void initData() async {
    PokeApi pokeapi = PokeApi();
    await pokeapi.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: pokeapi.pokemons);
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: SpinKitWave(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
