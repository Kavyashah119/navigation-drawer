import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navbar"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        child: Center(
          child: Text(
            "First Screen",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
