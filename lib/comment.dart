import 'package:flutter/material.dart';

class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
  Widget display() {
    return Center(
      child: Card(
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              debugPrint('Card tapped.');
            },
            child: Column(children: <Widget>[
              SizedBox(
                width: 300,
                height: 30,
                child: Text(this.id.toString()),
              ),
              SizedBox(
                width: 300,
                height: 30,
                child: Text("name : " + this.name),
              ),
              SizedBox(
                width: 300,
                height: 30,
                child: Text("email : " + this.email),
              ),
              SizedBox(
                width: 300,
                height: 100,
                child: Text(this.body),
              ),
            ])),
      ),
    );
  }
}
