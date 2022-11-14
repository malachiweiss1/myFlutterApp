import 'dart:async';
import 'dart:convert';

import 'package:p144/displayComment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:p144/Data.dart';
import 'package:p144/comment.dart';
import 'package:p144/dialog.dart';

Future<Comment> fetchComment(int i) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/comments/$i'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Comment.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

List<Widget> data = [];
int counter = 20;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void func() {
    setState(() {
      if (counter < 500) {
        counter += 20;
        for (int i = counter - 19; i <= counter; i++) {
          data.add(DisplayComment(fetchComment(i)));
        }
      }
    });
  }

  final url = "https://cambium.co.il/test/testAssignComment";

  void postData(String name, String email, String comment) async {
    try {
      final response = await http.post(Uri.parse(url),
          body: {"name": name, "email": email, "comment": comment});
      print("The comment was uploaded successfully");
    } catch (er) {
      print("error");
    }
  }

  void changeScreen() {
    setState(() {
      if (flag == true) {
        flag = false;
      } else {
        flag = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    for (int i = 1; i <= counter; i++) {
      data.add(DisplayComment(fetchComment(i)));
    }
  }

  void myFunc() {
    emailController.clear();
    nameController.clear();
    commentController.clear();
    postData(name, email, comment);
  }

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final commentController = TextEditingController();
  String email = "";
  String name = "";
  String comment = "";
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Fetch Data Example',
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
      home: flag == true
          ? Column(
              children: <Widget>[
                Container(
                    width: 600,
                    color: Colors.white,
                    child: ElevatedButton(
                        onPressed: changeScreen, child: Text("post comment"))),
                Expanded(child: Data(data, counter)),
                Container(
                    width: 600,
                    color: Colors.white,
                    child: ElevatedButton(
                        onPressed: func, child: Text("load 20 more comments")))
              ],
            )
          : Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextField(
                        maxLines: 5,
                        decoration: InputDecoration(labelText: 'comment'),
                        controller: commentController,
                        onChanged: (val) {
                          comment = val;
                        }),
                    TextField(
                      decoration: InputDecoration(labelText: 'email'),
                      controller: emailController,
                      onChanged: (val) {
                        email = val;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'name'),
                      controller: nameController,
                      onChanged: (val) {
                        name = val;
                      },
                    ),
                    DialogExample(myFunc, true),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            textStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                        onPressed: () => {changeScreen()},
                        child: Text("back")),
                    DialogExample(myFunc, false),
                  ],
                ),
              ),
            ),
    );
  }
}
