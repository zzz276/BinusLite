import 'dart:convert';
import 'package:binus_lite/helpers/logged_in_user.dart';
import 'package:binus_lite/helpers/snack_bar.dart';
import 'package:binus_lite/models/forum_post.dart';
import 'package:binus_lite/models/major.dart';
import 'package:binus_lite/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const urlpath = '10.0.2.2:3000';
const header = { "Content-Type": "application/json" };

Future<bool> signUp(BuildContext context, String username, String displayName, String email, String password) async {
  var response = await http.post(
    Uri.http(urlpath, '/api/user/signup'),
    headers: header,
    body: jsonEncode({
      "username": username,
      "displayname": displayName,
      "user_email": email,
      "user_password": password
    })
  );

  if (response.statusCode == 201) {
    var message = jsonDecode(response.body);

    showSnackBar(context, message["message"]);
    return true;
  } else {
    var message = jsonDecode(response.body);

    showSnackBar(context, message["message"]);

    return false;
  }
}

Future<void> logIn(BuildContext context, String email, String password) async {
  var response = await http.post(
    Uri.http(urlpath, '/api/user/login'),
    headers: header,
    body: jsonEncode({
      "user_email": email,
      "user_password": password
    })
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    LoggedInUser.loggedInUser = User(
      userID: data["userId"] as int,
      displayName: data["displayname"].toString(),
      username: data["username"].toString(),
      userEmail: email,
      userPassword: password
    );
  }
}

Future<void> updateUserProfile(BuildContext context, int userID, String displayName, String? picture) async {
  await http.patch(
    Uri.http(urlpath, '/api/user/$userID/updateProfile'),
    headers: header,
    body: jsonEncode({
      "displayname": displayName,
      "picture": picture
    })
  );
}

Future<bool> updatePassword(BuildContext context, int userID, String oldPassword, String newPassword) async {
  var response = await http.patch(
    Uri.http(urlpath, '/api/user/$userID/password'),
    body: {
      "old_password": oldPassword,
      "new_password": newPassword
    }
  );

  if (response.statusCode == 200) {return true;}
  else { return false; }
}

Future<List<Major>?> allMajor(BuildContext context) async {
  List<Major> majorsList = [];
  var response = await http.get(Uri.http(urlpath, '/api/major/allMajor'));

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);

    for (var element in result) { majorsList.add(Major.fromJson(element)); }
    return majorsList;
  } else { return null; }
}

Future<bool> createForum(BuildContext context, String question, String description, int userID) async {
  var response = await http.post(
    Uri.http(urlpath, '/api/forum/createForum'),
    headers: header,
    body: jsonEncode({
      "question": question,
      "description": description,
      "user_id": userID
    })
  );

  if (response.statusCode == 201) {
    var message = jsonDecode(response.body);

    showSnackBar(context, message["message"]);
    return true;
  } else {
    var message = jsonDecode(response.body);

    showSnackBar(context, message["message"]);
    return false;
  }
}

Future<List<ForumPost>?> allForum(BuildContext context) async {
  List<ForumPost> forumsList = [];
  var response = await http.get(Uri.http(urlpath, '/api/forum/allForum'));

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);

    for (var element in result) { forumsList.add(ForumPost.fromJson(element)); }
    return forumsList;
  } else { return null; }
}

Future<bool> vote(BuildContext context, int postID, int delta) async {
  var response = await http.patch(
    Uri.http(urlpath, '/api/forum/$postID/vote'),
    headers: header,
    body: jsonEncode({ "delta": delta })
  );

  if (response.statusCode == 200) {return true;}
  else { return false; }
}
