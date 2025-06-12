class ForumPost {
  int postID;
  String question;
  String? description;
  int userID;
  int voteCount;
  late List<String> replies;

  ForumPost({
    required this.postID,
    required this.question,
    this.description,
    required this.userID,
    required this.voteCount
  });

  factory ForumPost.fromJson(Map<String, dynamic> json) => ForumPost(
    postID: json['post_id'] as int,
    question: json['question'].toString(),
    description: json['description'].toString(),
    userID: json['user_id'] as int,
    voteCount: json['voteCount'] as int
  );
}
