import 'package:flutter/material.dart';
import '../models/item_model.dart';

class ResultsList extends StatelessWidget {
  final List<ItemModel> list;

  ResultsList({this.list});

  Widget build(context) {
    return Container(
      child: buildHroizontalList(),
    );
  }

  Widget buildHroizontalList() {
    final length = list.length;

    return Container(
      height: 220,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            height: 150,
            child: Card(
              elevation: 5.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    list[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Image.network(
                    list[index].imageURL,
                    width: 700.0,
                    height: 150.0,
                    alignment: Alignment.topLeft,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Rating:${list[index].rating}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                      ),
                      Text(
                        'Reviews:${list[index].reviews}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: length,
      ),
    );
  }
}
