import 'package:flutter/material.dart';

class DialogExample extends StatelessWidget {
  final VoidCallback function;
  final bool flag;
  DialogExample(this.function, this.flag);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: flag == true
            ? () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('You sent your comment!'),
                    content: const Text('thanks'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                          function();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                )
            : () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Hi!'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            style: TextStyle(fontSize: 15),
                            "My name is Malachi Weiss\n I hope you enjoyed my App"),
                        SizedBox(height: 30),
                        SizedBox(
                          child: Image.asset('images/profilePicture.jpg'),
                          width: 150,
                          height: 150,
                        )
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                          function();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
        child:
            flag == true ? const Text('Send') : const Text('© Malachi Weiss'));
  }
}


/*
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))

*/