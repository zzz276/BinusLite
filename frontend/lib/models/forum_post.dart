class ForumPost {
  int postID;
  String question;
  String? description;
  int voteCount;
  String username;

  ForumPost({
    required this.postID,
    required this.question,
    this.description,
    required this.voteCount,
    required this.username
  });

  factory ForumPost.fromJson(Map<String, dynamic> json) => ForumPost(
    postID: json['post_id'] as int,
    question: json['question'].toString(),
    description: json['description'].toString(),
    voteCount: json['voteCount'] as int,
    username: json['username'].toString(),
  );
}
