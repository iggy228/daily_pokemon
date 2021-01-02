import 'package:flutter/material.dart';

class HeaderGridView extends StatelessWidget {
  final Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final Widget header;

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
