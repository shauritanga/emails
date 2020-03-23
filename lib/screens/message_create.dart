import 'package:flutter/material.dart';

class MessageComposerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose New Message"),
      ),
      body: Column(
        children: <Widget>[
          Text(
            "Create new message",
          ),
        ],
      ),
    );
  }
}
