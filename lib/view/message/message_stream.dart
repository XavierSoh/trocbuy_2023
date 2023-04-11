import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'component/message_bubble.dart';

class MessageStream extends StatefulWidget {
  final String? email, name, receiverName, autorMail, id;
  final FirebaseFirestore? firebaseFirestore;

  MessageStream(
      {this.email,
      this.name,
      this.autorMail,
      this.receiverName,
      this.id,
      this.firebaseFirestore});

  @override
  _MessageStreamState createState() => _MessageStreamState();
}

class _MessageStreamState extends State<MessageStream> {
  bool isMe = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: widget.firebaseFirestore!
          .collection('ads')
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageBubbles = [];
        if (!snapshot.hasData) {}
        if (snapshot.hasData) {
          final messages = snapshot.data!.docs;
          for (var message in messages) {
            final messageText = message['text'];
            final senderMail = message['email'];
            final mailTo = message['emailto'] ?? widget.autorMail;
            final name = message['name'];
            final time = message['time'];
            //final currentUser = loggedInUser.email;
            if (widget.id == message['idAd']) {
              if (widget.email == senderMail) {
                MessageBubble messageBubble = MessageBubble(
                  email: senderMail ?? ' ',
                  emailto: widget.autorMail,
                  text: messageText ?? ' ',
                  name: name ?? ' ',
                  isMe: true,
                  time: time,
                );
                messageBubbles.add(messageBubble);
              } else if (widget.autorMail == mailTo) {
                MessageBubble messageBubble = MessageBubble(
                  email: senderMail ?? ' ',
                  emailto: widget.autorMail,
                  text: messageText ?? ' ',
                  name: name ?? ' ',
                  isMe: false,
                  time: time,
                );
                messageBubbles.add(messageBubble);
              }
            }
          }
        }

        return Container(
          height: MediaQuery.of(context).size.height * 0.65,
          child: ListView(
            //reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            children: messageBubbles.toList(),
          ),
        );
      },
    );
  }
}
