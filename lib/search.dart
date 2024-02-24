// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final TextEditingController _textController =
      TextEditingController(text: "Search");
  final List<String> _fakeSearchHistory = [
    "Flutter tutorials",
    "Widgets catalog",
    "Dart programming",
    "UI design tips"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Search'),
        ),
        body: Column(
          children: [
            searchbuild(),
            SizedBox(height: 20),
            fakeSearchHistory(),
          ],
        ),
      ),
    );
  }

  Widget searchbuild() => Container(
        padding: EdgeInsets.only(
          top: 0,
        ),
        child: TextField(
          controller: _textController,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search), // Add icon here
          ),
        ),
      );

  Widget fakeSearchHistory() => Expanded(
        child: ListView.builder(
          itemCount: _fakeSearchHistory.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_fakeSearchHistory[index]),
              onTap: () {
                _textController.text = _fakeSearchHistory[index];
              },
            );
          },
        ),
      );
}
