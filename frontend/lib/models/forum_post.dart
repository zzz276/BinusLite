class ForumPost {
  String question;
  String? description;
  String username;
  int voteCount;
  late List<String> replies;

  ForumPost({
    required this.question,
    this.description,
    required this.username,
    this.voteCount = 0
  });
}
