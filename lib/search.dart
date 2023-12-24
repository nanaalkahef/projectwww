import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {}, icon: Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.green[700],
          size: 30,
          weight: 30,
        ));
    ;
  }

  @override
  Widget buildResults(BuildContext context) {
    return throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Please search here about your product",
          style: TextStyle(color: Colors.green[700], fontSize: 20),
        )
      ],
    ));
  }
}
