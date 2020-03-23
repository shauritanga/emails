import 'package:flutter/material.dart';

class MessageDetailsScreen extends StatelessWidget {
  final String title;
  final String message;

  const MessageDetailsScreen(
      {Key key, @required this.title, @required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Text(message),
      ),
    );
  }
}
