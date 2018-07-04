import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/data/db/database.dart';
import 'package:flutter_sample_app/domain/models/user.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample app"),
      ),
      body: ListContainer(),
    );
  }
}

class ListContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListContainerState();
}

class ListContainerState extends State<ListContainer> {
  final db = Database();
  var items = <User>[];

  @override
  void initState() {
    super.initState();
    _showUsers();
  }

  @override
  Widget build(BuildContext context) {
    if (items.isNotEmpty) {
      return ListView.builder(
        itemBuilder: buildListItem,
        itemCount: items.length,
      );
    } else {
      return Text("list empty");
    }
  }

  Widget buildListItem(BuildContext context, int index) {
    final userItem = items[index];
    return ListTile(
      title: Text(userItem.name),
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(userItem.avatarUrl),
      ),
      subtitle: Text(userItem.gender),
    );
  }

  void _showUsers() async {
    var usersStream = await db.getUsersStream();

    var users = <User>[];

    //Далее идет говнокод
    usersStream.listen((event) {
      users.clear();
      print(event.snapshot.value);

      var list = event.snapshot.value as List;
      for (int i = 0; i < list.length; i++) {
        users.add(User.fromSnapshot(event.snapshot.value[i]));
      }
      setState(() {
        items = users;
      });
    });
  }
}
