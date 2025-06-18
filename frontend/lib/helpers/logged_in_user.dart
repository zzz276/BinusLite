import 'package:binus_lite/models/forum_post.dart';
import 'package:binus_lite/models/major.dart';
import 'package:binus_lite/models/user.dart';

class LoggedInUser {
  static User? loggedInUser;
  static List<ForumPost>? posts;
  static List<Major>? majors;
}
