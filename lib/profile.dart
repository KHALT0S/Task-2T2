// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello World App',
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      //App Bar-------------
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[100],
        title: Text(
          'Profile',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black45),
        ),
        //--------------------
      ),
      body: ListView(
        children: <Widget>[
          buildTop(context),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: buildContactInfo(context),
                height: 900,
                width: screenSize.width * .9,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[200],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
              )),
        ],
      ),
    );
  }

//Build Top ------------------------------------------------------
  Widget buildTop(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(width: screenSize.width, child: CoverImage()),
        Container(
          padding: EdgeInsets.all(25),
          child: Positioned(
            top: 40,
            child: ProfileImage(),
          ),
        ),
        Container(
          child: Positioned(
            left: 130,
            top: 80,
            child: Text(
              '@Habib Al-Shaikh',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 60,
                right: 20,
              ),
              child: Positioned(
                top: 40,
                child: SaveProfile(),
              ),
            ),
          ],
        ),
      ],
    );
  }

// Cover Image
  Widget CoverImage() => Container(
        color: Colors.blueGrey[300],
        child: Image.network(
          'https://media.evo.co.uk/image/private/s--dvMCsHMJ--/v1556259376/evo/images/dir_594/car_photo_297075.jpg',
          height: 80,
          fit: BoxFit.cover,
        ),
      );
// Profile Image
  Widget ProfileImage() => CircleAvatar(
        radius: 50,
        backgroundColor: Colors.blueGrey[100],
        backgroundImage: NetworkImage(
          'https://media.evo.co.uk/image/private/s--dvMCsHMJ--/v1556259376/evo/images/dir_594/car_photo_297075.jpg',
        ),
      );

//save button
  Widget SaveProfile() => LikeButton(
        size: 36,
        likeCount: 910,
        countPostion: CountPostion.bottom,
        likeBuilder: ((isTapped) {
          return Icon(
            Icons.bookmark,
            size: 36,
            color: isTapped ? Colors.redAccent : Colors.grey,
          );
        }),
      );

//------------------------------------------------------------------------------

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
