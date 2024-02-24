// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello World App',
      color: Colors.blueGrey[100],
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: buildContactInfo(context),
                height: 900,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //content ----------------------------------------------------------------------
//posts
  Widget buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        // Fake posts
        buildPost(context, 'Post 1'),
        buildPost(context, 'Post 2'),
        buildPost(context, 'Post 3'),
      ],
    );
  }

  Widget buildPost(BuildContext context, String content) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              content,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'This is a fake post content.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '10 likes',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                Text(
                  '5 comments',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
