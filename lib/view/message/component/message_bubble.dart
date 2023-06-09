import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trocbuy/model/message_model.dart';
import 'package:trocbuy/view/account/account_home.dart';
import '../../../global_functions/init_data.dart';
import '../../../res/styles.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    final timeFormatted = DateFormat.yMMMMEEEEd('fr_FR').format(message.date) +
        ', ' +
        DateFormat.Hm().format(message.date);
    bool isMe = InitData.prefs.getString("email") == message.senderEmail;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          /*  !isMe? Text(
            message.author??'--',
            style:
                const TextStyle(fontSize: 16.0, color: Styles.principalColor),
          ):const SizedBox.shrink(),*/
          Container(
            width: MediaQuery.of(context).size.width * 65 / 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: isMe ? Theme.of(context).primaryColor : Colors.green,
                width: 2,
              ),
            ),
            child: message.message != null
                ? Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          timeFormatted,
                          style: const TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0, right: 8.0),
                          child: Text(
                            message.message ?? '',
                            style: const TextStyle(fontSize: 18.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
