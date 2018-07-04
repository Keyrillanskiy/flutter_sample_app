class User {
  String name;
  String gender;
  String avatarUrl;

  User.fromSnapshot(Map data)
      : name = data["name"],
        gender = data["gender"],
        avatarUrl = data["avatarUrl"];
}
