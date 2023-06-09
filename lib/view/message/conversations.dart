import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/global_functions/init_data.dart';
import 'package:trocbuy/providers/message_model_prov.dart';
import 'package:trocbuy/view/message/component/chat_text_widget.dart';

import '../../res/styles.dart';

import 'message_stream.dart';

final firebaseFirestore = FirebaseFirestore.instance;

class Conversations extends StatefulWidget {
  const Conversations({Key? key}) : super(key: key);

  @override
  _ConversationsState createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  final myTextController = TextEditingController();

  bool? isShowSticker;
  GoogleSignInAccount? googleSignIn;

  Future<bool> onBackPress() {
    if (isShowSticker!) {
      setState(() {
        isShowSticker = false;
      });
    } else {
      Navigator.pop(context);
    }
    return Future.value(false);
  }

  @override
  void initState() {
    super.initState();

    isShowSticker = false;
  }

  @override
  Widget build(BuildContext context) {
    final messageModel = context.watch<MessageModelProv>().messageModel;
    bool isMe = InitData.prefs.getString("email") == messageModel.senderEmail;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.principalColor,
        title: Text(messageModel.author ?? 'Conversation'),
        //actions: const [Plus()],
      ),
      body: WillPopScope(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              const Expanded(child: MessageStream()),
              ChatTextWidgtet(myTextController: myTextController)
            ],
          ),
        ),
        onWillPop: onBackPress,
      ),
    );
  }
}
