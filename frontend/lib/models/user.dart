class User {
  int userID;
  String displayName;
  String username;
  String userEmail;
  String userPassword;
  String? picture;

  User({
    required this.userID,
    required this.displayName,
    required this.username,
    required this.userEmail,
    required this.userPassword,
    this.picture
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userID: json['user_id'] as int,
    displayName: json['displayname'].toString(),
    username: json['username'].toString(),
    userEmail: json['user_email'].toString(),
    userPassword: json['user_password'].toString(),
    picture: json['picture'].toString()
  );
}
