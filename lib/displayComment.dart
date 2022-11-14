import 'package:flutter/material.dart';
import 'package:p144/main.dart';
import 'package:p144/Data.dart';
import 'package:p144/comment.dart';

class DisplayComment extends StatelessWidget {
  late Future<Comment> futureComment;

  DisplayComment(this.futureComment);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Comment>(
        future: futureComment,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.display();
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
