import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import '../models/message.dart';
import './message_details.dart';
import './message_create.dart';

class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> messages;

  void initState() {
    super.initState();
    messages = Message.broswe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                var _messages = Message.broswe();

                setState(() {
                  messages = _messages;
                });
              }),
        ],
      ),
      body: FutureBuilder(
          future: messages,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.active:
              case ConnectionState.none:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                return ListView.separated(
                  itemCount: snapshot.data.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    Message message = snapshot.data[index];
                    return ListTile(
                      title: Text(message.subject),
                      subtitle: Text(
                        message.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: CircleAvatar(
                        child: Text("AS"),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return MessageDetailsScreen(
                                title: message.subject,
                                message: message.body,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              default:
                return Center(
                  child: Text("N other options"),
                );
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MessageComposerScreen(),
            ),
          );
        },
      ),
    );
  }
}
