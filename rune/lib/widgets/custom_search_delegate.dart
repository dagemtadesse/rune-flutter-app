import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Mechanical Engineering",
    "Software Engineering",
    "Electrical Engineering"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var channel in searchTerms) {
      if (channel.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(channel);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (BuildContext context, int index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var channel in searchTerms) {
      if (channel.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(channel);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (BuildContext context, int index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
