import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  int counter;
  List<Widget> data;
  Data(this.data, this.counter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        title: const Text.rich(TextSpan(
            text: 'Comments', style: TextStyle(fontWeight: FontWeight.bold))),
      ),
      body: Center(
        child: Scrollbar(
          child: ListView.builder(
            itemCount: counter,
            itemBuilder: (context, index) => ListTile(title: data[index]),
          ),
        ),
      ),
    );
  }
}
