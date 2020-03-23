import 'dart:convert';

import 'package:flutter/services.dart';
//import 'package:http/http.dart' as http;

class Message {
  final String subject;
  final String body;

  Message({this.subject, this.body});

  Message.fromJson(Map<String, dynamic> json)
      : subject = json['subject'],
        body = json['body'];

  static Future<List<Message>> broswe() async {
    String content = await rootBundle.loadString('data/messages.json');
    // http.Response response =
    //     await http.get("http://www.mocky.io/v2/5e778404330000c244099ffc");
    await Future.delayed(Duration(seconds: 3));

    //List collection = json.decode(response.body);
    List collection = json.decode(content);

    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}
