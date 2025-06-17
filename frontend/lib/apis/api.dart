import 'dart:convert';
import 'package:binus_lite/helpers/snack_bar.dart';
import 'package:binus_lite/models/forum_post.dart';
import 'package:binus_lite/models/major.dart';
import 'package:binus_lite/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const urlpath = 'http://10.0.2.2:3000';
const header = { "content-type": "application/json; charset=utf-8" };

Future<bool> signUp(BuildContext context, String username, String displayName, String email, String password) async {
  var response = await http.post(Uri.parse('$urlpath/api/user/signup'),
    // headers: header,
    body: {
      "username": username,
      "displayname": displayName,
      "user_email": email,
      "user_password": password
    }
  );

  var message = jsonDecode(response.body);

  showSnackBar(context, message['message']);
  return (response.statusCode == 201);
}

Future<User?> logIn(BuildContext context, String email, String password) async {
  var response = await http.post(Uri.parse('$urlpath/api/user/login'), body: {
    "user_email": email,
    "user_password": password
  });

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    showSnackBar(context, data['message']);
    return User(
      userID: data['userId'],
      displayName: data['displayname'],
      username: data['username'],
      userEmail: email,
      userPassword: password
    );
  } else {
    var message = jsonDecode(response.body);

    showSnackBar(context, message['message']);
    return null;
  }
}

Future<void> updateUserProfile(BuildContext context, int userID, String displayName, String? picture) async {
  var response = await http.patch(Uri.parse('$urlpath/api/user/$userID/updateProfile'), body: {
    "displayname": displayName,
    "picture": picture
  });

  var message = jsonDecode(response.body);

  showSnackBar(context, message['message']);
}

Future<bool> updatePassword(BuildContext context, int userID, String oldPassword, String newPassword) async {
  var response = await http.patch(Uri.parse('$urlpath/api/user/$userID/password'), body: {
    "old_password": oldPassword,
    "new_password": newPassword
  });

  var message = jsonDecode(response.body);

  showSnackBar(context, message['message']);

  return (response.statusCode == 200);
}

Future<List<Major>?> allMajor(BuildContext context) async {
  List<Major> majorsList = [];
  var response = await http.get(Uri.parse('$urlpath/api/major/allMajor'));

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);

    for (var element in result) { majorsList.add(Major.fromJson(element)); }
    return majorsList;
  } else {
    var message = jsonDecode(response.body);

    showSnackBar(context, message['message']);
    return null;
  }
}

Future<bool> createForum(BuildContext context, String question, String description, int userID) async {
  var response = await http.post(Uri.parse('$urlpath/api/forum/createForum'), body: {
    "question": question,
    "description": description,
    "user_id": userID
  });

  var message = jsonDecode(response.body);

  showSnackBar(context, message['message']);
  return (response.statusCode == 201);
}

Future<List<ForumPost>?> allForum(BuildContext context) async {
  List<ForumPost> forumsList = [];
  var response = await http.get(Uri.parse('$urlpath/api/forum/allForum'));

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);

    for (var element in result) { forumsList.add(ForumPost.fromJson(element)); }
    return forumsList;
  } else {
    var message = jsonDecode(response.body);

    showSnackBar(context, message['message']);
    return null;
  }
}

Future<bool> vote(BuildContext context, int postID, int delta) async {
  var response = await http.patch(Uri.parse('$urlpath/api/forum/$postID/vote'));
  var message = jsonDecode(response.body);

  showSnackBar(context, message['message']);
  return (response.statusCode == 200);
}
