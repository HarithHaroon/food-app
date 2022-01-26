import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function setSearchTerm;

  SearchBar({this.setSearchTerm});

  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      width: double.infinity,
      child: TextField(
        onSubmitted: (term) => setSearchTerm(term),
        decoration: InputDecoration(
          hintText: 'Enter a search term',
          icon: Icon(
            Icons.search,
            size: 30.0,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
