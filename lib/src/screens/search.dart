import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/results_list.dart';
import '../widgets/search_bar.dart';
import '../models/results_model.dart';
import '../models/item_model.dart';

class SearchState extends StatefulWidget {
  Search createState() => Search();
}

class Search extends State<SearchState> {
  String searchTerm;
  List<ItemModel> resultsList = [];

  Widget build(context) {
    List<ItemModel> costEffective =
        resultsList.where((item) => item.price == '\$').toList();
    List<ItemModel> bitPricier =
        resultsList.where((item) => item.price == '\$\$').toList();
    List<ItemModel> bigSpender =
        resultsList.where((item) => item.price == '\$\$\$').toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Business Search',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(
                setSearchTerm: setSearchTerm,
              ),
              ResultsList(
                list: costEffective,
              ),
              ResultsList(
                list: bitPricier,
              ),
              ResultsList(
                list: bigSpender,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setSearchTerm(String term) {
    setState(() {
      searchTerm = term;
    });
    fetchResults(searchTerm);
  }

  fetchResults(String term) async {
    String url =
        'https://api.yelp.com/v3/businesses/search?limit=50&location=canada&term=$term';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer RReCP_QkVMOVLQxw7YzGKvyhl0GtCdDq42KCvxgan2t-jEoNUlBPQYkzrvsjdoFv9NZz_s0Fmz-QQ8U-UeOfvYZwcGg5WoZGNnpf2S5zb2WgDLuASTra8IYIcl8hYXYx',
      },
    );

    var parsedJson = jsonDecode(response.body);

    var resultsModel = ResultsModel.fromJson(parsedJson);
    if (resultsModel.businesses != null) {
      resultsModel.businesses.asMap().forEach((index, value) {
        var newValue = ItemModel.fromModel(value);
        setState(() {
          resultsList.add(newValue);
        });
      });
    }
  }
}
