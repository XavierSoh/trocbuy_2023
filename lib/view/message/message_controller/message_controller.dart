import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/global_functions/init_data.dart';
import 'package:trocbuy/model/message_model.dart';
import 'package:trocbuy/providers/message_model_prov.dart';

final firebaseFirestore = FirebaseFirestore.instance;

class MessageController {
  static Future<void> updateReadState(BuildContext context) async {
    final messageModel = context.read<MessageModelProv>().messageModel;
    final updateReadSte = await firebaseFirestore
        .collection('messages')
        .where(
          'emails',
          arrayContains: InitData.prefs.getString("email"),
        )
        .where('receiver_email', isEqualTo: InitData.prefs.getString("email"))
        .where('sender_email', isEqualTo: messageModel.sender)
        .get();

    final docs = updateReadSte.docs;
    for (var doc in docs) {
      await firebaseFirestore.collection('messages').doc(doc.id).update(
        {
          'unread': false,
        },
      );
    }
  }

  static Future<int> countUnread(MessageModel messageModel) async {
    final snapshot = await firebaseFirestore
        .collection('messages')
        .where(
          'emails',
          arrayContains: InitData.prefs.getString("email"),
        )
        .where('receiver_email', isEqualTo: InitData.prefs.getString("email"))
        .where('sender_email', isEqualTo: messageModel.senderEmail)
        .where('unread', isEqualTo: true)
        .get();

    return snapshot.size;
  }

  static Stream<QuerySnapshot> countAllUnread= firebaseFirestore
        .collection('messages')

        .where(
          'receiver_email',
          isEqualTo: InitData.prefs.getString("email"),
        )
        .where('unread', isEqualTo: true)
        .snapshots();


}
