import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_sample_app/domain/models/user.dart';
import 'package:firebase_database/firebase_database.dart';

const DATABASE_NAME = "fluttersampleapp";
const DATABASE_URL = "https://fluttersampleapp.firebaseio.com/";
const API_KEY = "AIzaSyDxeupiBBQeo3rmN9Nm-mQiCL_iJDbgjQQ";
const GOOGLE_APP_ID_ANDROID = "1:694145091470:android:2104c70bb9bc3111";
const GOOGLE_APP_ID_IOS = "1:694145091470:ios:2104c70bb9bc3111";
const GCM_SENDER_ID = "694145091470";

class Database {

  static FirebaseApp firebaseApp;

  static void configureDatabase() async {
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

  FirebaseDatabase firebaseDB;
  DatabaseReference db;

  Database() {
    firebaseDB = FirebaseDatabase.instance;
    db = firebaseDB.reference();
  }

  Future<List<User>> getUsers() async {
    db
  }
}