import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../res/styles.dart';

import 'chat_text_widget.dart';
import 'icons_chat_button.dart';

class BuildInput extends StatelessWidget {
  final Function() onpressed;
  final TextEditingController mytextcontroller;
  final String id, email, autormail, name;
  final FirebaseFirestore firebaseFirestore;

  const BuildInput(
      {required this.onpressed,
      required this.mytextcontroller,
      required this.id,
      required this.email,
      required this.autormail,
      required this.name,
      required this.firebaseFirestore});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        //emoji
        IconsChatButton(
            icon: const Icon(Icons.emoji_emotions), onpressed: onpressed),
        // Button send image
        IconsChatButton(onpressed: () {}, icon: const Icon(Icons.image)),
        // Edit text
        ChatTextWidgtet(myTextController: mytextcontroller),
        // Button send message
        IconsChatButton(
            icon: const Icon(Icons.send),
            onpressed: () async {
              await firebaseFirestore.collection('ads').add({
                'idAd': id,
                'email_receiver': <String>[email, autormail],
                'email': email,
                'emailto': autormail,
                'name': name,
                'text': mytextcontroller.text,
                'time': Timestamp.now()
              });
              mytextcontroller.clear();
            }),
      ]),
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Styles.principalColor, width: 0.5),
          ),
          color: Colors.white),
    );
  }
}
