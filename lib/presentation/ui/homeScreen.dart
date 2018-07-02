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
    Database.configureDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sample app"),),
      body: ListContainer(),
    );
  }

}

class ListContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListContainerState();
}

class ListContainerState extends State<ListContainer> {

  List<User> items = List();

  @override
  void initState() {
    super.initState();
    showUsers();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: buildListItem, itemCount: items.length,);
  }

  Widget buildListItem(BuildContext context, int index) {
    return ListTile(title: Text(items[index].firstName + items[index].lastLame),
      leading: CircleAvatar(backgroundColor: Colors.blueAccent,),);
  }

  void showUsers() async {
    var users = await db.getUsers();
    setState(() {
      items.addAll(users);
    });
  }

}