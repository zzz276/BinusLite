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
}
