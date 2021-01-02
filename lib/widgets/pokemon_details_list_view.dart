import 'package:flutter/material.dart';

class PokemonDetailsListView extends StatelessWidget {
  Widget header;
  Widget title;
  Widget rowListView;
  Widget description;
  Function(BuildContext, int) itemBuilder;
  int itemCount;

  PokemonDetailsListView({
    this.header,
    this.title,
    this.rowListView,
    this.description,
    this.itemBuilder,
    this.itemCount
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              header,
              SizedBox(height: 8),
              title,
              SizedBox(height: 8),
              rowListView,
              SizedBox(height: 16),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              itemBuilder,
              childCount: itemCount,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          sliver: SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                SizedBox(height: 16),
                description,
              ]
            ),
          ),
        ),
      ],
    );
  }
}
