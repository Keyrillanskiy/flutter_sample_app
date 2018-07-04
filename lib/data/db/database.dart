import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

const DATABASE_NAME = "fluttersampleapp";
const DATABASE_URL = "https://fluttersampleapp.firebaseio.com/";
const API_KEY = "AIzaSyDxeupiBBQeo3rmN9Nm-mQiCL_iJDbgjQQ";
const GOOGLE_APP_ID_ANDROID = "1:694145091470:android:2104c70bb9bc3111";
const GOOGLE_APP_ID_IOS = "1:694145091470:ios:2104c70bb9bc3111";
const GCM_SENDER_ID = "694145091470";

class Database {
  static final Database _instance = Database._internal();

  FirebaseDatabase firebaseDB;
  DatabaseReference dbUsers;

  factory Database() {
    return _instance;
  }

  Database._internal() {
    _configureDatabase();

    firebaseDB = FirebaseDatabase.instance
      ..setPersistenceEnabled(true);
    dbUsers = firebaseDB.reference().child("users")
      ..keepSynced(true);
  }

  static FirebaseApp firebaseApp;

  void _configureDatabase() async {
    firebaseApp = await FirebaseApp.configure(
      name: DATABASE_NAME,
      options: Platform.isIOS
          ? const FirebaseOptions(
              googleAppID: GOOGLE_APP_ID_IOS,
              gcmSenderID: GCM_SENDER_ID,
              databaseURL: DATABASE_URL,
            )
          : const FirebaseOptions(
              googleAppID: GOOGLE_APP_ID_ANDROID,
              apiKey: API_KEY,
              databaseURL: DATABASE_URL,
            ),
    );
  }

  Future<Stream<Event>> getUsersStream() async {
    return dbUsers.orderByChild("name").onValue;
  }
}
