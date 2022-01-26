import 'package:flutter/material.dart';

class Scroll extends StatelessWidget {
  final List<String> items = [
    'Item #',
    'Item #',
    'Item #',
    'Item #',
    'Item #',
    'Item #',
    'Item #',
    'Item #',
    'Item #',
    'Item #',
    'Item #',
    'Item #',
    'Item #',
    'Item #',
    'Item #',
    'Item #',
    'Item #',
  ];

  Widget build(context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            child: Text(items[index] + '$index'),
            margin: EdgeInsets.only(right: 50.0),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
