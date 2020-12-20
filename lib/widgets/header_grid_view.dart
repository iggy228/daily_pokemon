import 'package:flutter/material.dart';
import 'package:flutter_animation/models/PokemonBasic.dart';
import 'package:flutter_animation/widgets/main_card.dart';

class HeaderGridView extends StatelessWidget {
  Function itemBuilder;
  int itemCount;
  Widget header;

  HeaderGridView({this.itemBuilder, this.itemCount, this.header});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              header,
            ]
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildBuilderDelegate(
            itemBuilder,
            childCount: itemCount,
          ),
        ),
      ],
    );
  }
}
