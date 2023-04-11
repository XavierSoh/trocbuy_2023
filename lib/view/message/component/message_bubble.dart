import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import '../../../res/styles.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    this.email,
    this.emailto,
    this.text,
    this.isMe,
    this.time,
    this.name,
  });

  final String? email;
  final String? emailto;
  final String? text;
  final Timestamp? time;
  final bool? isMe;
  final String? name;

  @override
  Widget build(BuildContext context) {
    String timeFormatted = '';
    if (time != null) {
      final dateTime = time?.toDate();
      timeFormatted = dateTime!.format(DateTimeFormats.europeanAbbr).toString();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
      child: Column(
        crossAxisAlignment:
            isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            name ?? '',
            style:
                const TextStyle(fontSize: 16.0, color: Styles.principalColor),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 65 / 100,
            decoration: BoxDecoration(
                border: Border.all(
                    color: isMe! ? Colors.green : Colors.black54, width: 1.5)),
            child: text != null
                ? Column(
                    children: [
                      time != null
                          ? Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                timeFormatted,
                                style: const TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                            )
                          : const Text(''),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 8.0, bottom: 8.0, right: 8.0),
                          child: Text(
                            '$text',
                            style: const TextStyle(
                                fontSize: 18.0, color: Colors.black),
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
