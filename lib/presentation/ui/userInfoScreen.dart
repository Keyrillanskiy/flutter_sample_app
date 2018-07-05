import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/domain/models/user.dart';

class UserInfoScreen extends StatelessWidget {
  final User user;

  UserInfoScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User info"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16.0),
              child: CachedNetworkImage(
                imageUrl: user.avatarUrl,
                errorWidget: Icon(Icons.error),
                placeholder: CircularProgressIndicator(),
              ),
            ),
            Text(
              user.name,
              style: TextStyle(fontSize: 18.0),
            ),
            Text(user.gender),
          ],
        ),
      ),
    );
  }
}
