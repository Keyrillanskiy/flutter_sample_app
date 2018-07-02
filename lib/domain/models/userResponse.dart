import 'package:flutter_sample_app/domain/models/user.dart';

class UserResponse {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<User> users;
}