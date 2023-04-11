import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/styles.dart';
import 'component/build_input.dart';
import 'component/message_stream2.dart';
import 'component/plus.dart';
import 'component/warning.dart';
import 'message_stream.dart';

final firebaseFirestore = FirebaseFirestore.instance;

class Conversations extends StatefulWidget {
  final String? autorName, autorMail, id;
  final String? currentUserId;

  const Conversations({Key? key, this.currentUserId, this.autorName, this.id, this.autorMail})
      : super(key: key);

  @override
  _ConversationsState createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  final myTextController = TextEditingController();
  String? email, name, messageText;
  bool? isShowSticker;
  GoogleSignInAccount? googleSignIn;

  Future<String> getSenderMail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //TODO : Replace with sharePreference
    email = prefs.getString('email');
    return ' email';
  }

  Future<String> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //TODO : Replace with sharePreference
    name = prefs.getString('name');
    return 'name';
  }

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

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    //create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    //once signin return the usercredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  void initState() {
    super.initState();
    getSenderMail();
    getName();
    isShowSticker = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.principalColor,
        title: Text(widget.autorName!.isNotEmpty ? widget.autorName! : 'Conversation'),
        actions: const [Plus()],
      ),
      body: SafeArea(
        child: WillPopScope(
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Warning(),
                    MessageStream2(
                      id: widget.id ?? "",
                    ),
                    Expanded(
                      child: MessageStream(
                        autorMail: widget.autorMail,
                        email: email,
                        name: name,
                        id: widget.id,
                        firebaseFirestore: firebaseFirestore,
                      ),
                    ), //affice le flux de messages
                    // Input content
                    Column(
                      children: [
                        BuildInput(
                          autormail: widget.autorMail ?? "",
                          email: email ?? "",
                          name: name ?? "",
                          mytextcontroller: myTextController,
                          id: widget.id ?? "",
                          firebaseFirestore: firebaseFirestore,
                          onpressed: () {
                            setState(
                              () {
                                isShowSticker = !isShowSticker!;
                              },
                            );
                          },
                        ),
                        // isShowSticker!
                        //     ? BuildStickers(
                        //         onpressed: (emoji, category) {
                        //           setState(
                        //             () {
                        //               myTextController.text += emoji.emoji;
                        //             },
                        //           );
                        //         },
                        //       )
                        //     : Container()
                      ],
                    ),
                    // Sticker
                  ],
                )
              ],
            ),
            onWillPop: onBackPress),
      ),
    );
  }
}
