import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pokemon of Day',
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
          Divider(color: Colors.black),
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  'images/fennekin.png',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      'Fennekin',
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'There is lot of text aboat fenneking and his cuteness uwu',
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
