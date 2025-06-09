class ForumPost {
  String title;
  String question;
  String username;
  int voteCount;
  late List<String> replies;

  ForumPost({this.title = "", required this.question, required this.username, this.voteCount = 0});
}
