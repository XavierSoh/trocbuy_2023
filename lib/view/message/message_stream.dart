import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/global_functions/init_data.dart';
import 'package:trocbuy/model/message_model.dart';
import 'package:trocbuy/model/user_infos.dart';
import 'package:trocbuy/providers/message_model_prov.dart';
import 'package:trocbuy/utils/utils.dart';

import 'component/message_bubble.dart';
import 'component/warning.dart';

final firebaseFirestore = FirebaseFirestore.instance;

class MessageStream extends StatefulWidget {
  const MessageStream({super.key});

  @override
  _MessageStreamState createState() => _MessageStreamState();
}

class _MessageStreamState extends State<MessageStream> {
  bool isMe = false;


  @override
  Widget build(BuildContext context) {
    final stream = firebaseFirestore
        .collection(Utils.messagesCollectionName)
        .where(Utils.conversationDoc, isEqualTo: Utils.buildConversationCollection(context))
        .withConverter<MessageModel>(
      fromFirestore: (value, _) {
        final MessageModel message = MessageModel.fromJson(value.data()!);
        message.reference = value.id;
        return message;
      },
      toFirestore: (message, _) => message.toJson(),
    ).orderBy('date', descending: true)
        .snapshots();
    final messageModel = context.watch<MessageModelProv>().messageModel;
    messageModel.conversation = Utils.buildConversationCollection(context);
    return StreamBuilder<QuerySnapshot<MessageModel>>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<MessageModel>> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CupertinoActivityIndicator(radius: 40.0,),
          );
        }

        return SizedBox(
         height: MediaQuery.of(context).size.height*
          68/100,
          child: ListView(
            reverse: true,
shrinkWrap: true,
            children: [

              ...snapshot.data!.docs.map((DocumentSnapshot<MessageModel> document) {
       var  messageModel = document.data()!;
              return MessageBubble(message: messageModel);
            }).toList(),
              const Warning(),
            ]
          ),
        );
      },
    );
  }
}
