import 'package:flutter/material.dart';
import './screens/search.dart';
// import './screens/scroll.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food',
      home: SearchState(),
    );
  }
}
