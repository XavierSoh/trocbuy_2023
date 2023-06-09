import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/providers/message_model_prov.dart';
import 'package:trocbuy/utils/utils.dart';

import '../../../res/styles.dart';

final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class ChatTextWidgtet extends StatelessWidget {
  const ChatTextWidgtet({
    Key? key,
    required this.myTextController,
  }) : super(key: key);

  final TextEditingController myTextController;

  @override
  Widget build(BuildContext context) {
    final messageModel = context.watch<MessageModelProv>().messageModel;

    return TextFormField(
      maxLines: null,
      keyboardType: TextInputType.multiline,
      controller: myTextController,
      style: const TextStyle(color: Styles.principalColor),

      decoration: InputDecoration(
        hintText: 'Votre message...',
        hintStyle: const TextStyle(
          color: Styles.principalColor,
        ),
        suffix: IconButton(
            onPressed: () async {
              messageModel.message = myTextController.text.trim();
              messageModel.date = DateTime.now();

              messageModel.conversation = Utils.buildConversationCollection(context);
              await firebaseFirestore
                  .collection(Utils.messagesCollectionName)
                  .add(messageModel.toJson())
                  .then(
                (value) async {
                  //Todo:Après un message envoyé
                },
              );

              myTextController.clear();
            },
            icon: const Icon(Icons.send),
            color: Styles.principalColor),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Styles.principalColor, width: 2.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
