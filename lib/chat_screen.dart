import 'package:app_chat/chat_message.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var _controller = TextEditingController();

  final List<ChatMessage> _mesajlar = [];

  void _Submitted(String text) {
    _controller.clear();
    ChatMessage message = new ChatMessage(text);
    setState(() {
      _mesajlar.insert(0, message);
    });
  }

  Widget textGirisi() {
    return IconTheme(
      data: IconThemeData(color: Colors.lightBlue),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Mesaj  Yaz",
                ),
                onSubmitted: _Submitted,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: IconButton(
                icon: Icon(
                  Icons.send,
                ),
                onPressed: () {
                  _Submitted(_controller.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            reverse: true,
            itemBuilder: (context, index) {
              return _mesajlar[index];
            },
            itemCount: _mesajlar.length,
          ),
        ),
        Divider(
          height: 1,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: textGirisi(),
        ),
      ],
    );
  }
}
