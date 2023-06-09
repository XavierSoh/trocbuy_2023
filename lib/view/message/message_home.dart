import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/global_functions/init_data.dart';
import 'package:trocbuy/model/is_login.dart';
import 'package:trocbuy/model/message_model.dart';
import 'package:trocbuy/providers/message_model_prov.dart';
import 'package:trocbuy/res/strings.dart';
import 'package:trocbuy/res/styles.dart';
import 'package:trocbuy/view/login_page/login_page.dart';
import 'package:trocbuy/view/message/conversations.dart';
import 'package:trocbuy/view/message/message_controller/message_controller.dart';

class MessageHome extends StatelessWidget {
  MessageHome({Key? key}) : super(key: key);
  final firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.principalColor,
        title: Text(Strings.kMessage),
      ),
      body: IsLogin.state == true
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: StreamBuilder<QuerySnapshot<MessageModel>>(
                stream: firebaseFirestore
                    .collection('messages')
                    .orderBy('date', descending: true)
                    .where(
                      'emails',
                      arrayContains: InitData.prefs.getString("email"),
                    )
                    .withConverter<MessageModel>(
                      fromFirestore: (value, _) {
                        final MessageModel message = MessageModel.fromJson(value.data()!);
                        message.reference = value.id;
                        return message;
                      },
                      toFirestore: (message, _) => message.toJson(),
                    )
                    .snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<QuerySnapshot<MessageModel>> snapshot) {
                  if (snapshot.hasError) {
                    if (kDebugMode) {
                      print('Message errors>>> ${snapshot.error}');
                    }
                    return const Center(child: Text('Erreur inatendue'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.data!.docs.isNotEmpty) {
                    List<MessageModel> data = snapshot.data!.docs.map((e) => e.data()).toList();
                    data = data.toSet().toList();

                    return ListView(
                        children: data.map(
                      (document) {
                        return Card(
                          child: ListTile(
                              onTap: () async {
                                print(document.toJson());
                                context.read<MessageModelProv>().change(document);

                                await MessageController.updateReadState(context).then(
                                  (value) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Conversations(),
                                      ),
                                      (route) => route.isFirst,
                                    );
                                  },
                                );
                              },
                              title: Text(
                                document.author ?? '---',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  //Text(document.senderEmail),
                                  const Divider(),
                                  Text(
                                    document.message ?? '...',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              trailing: FutureBuilder(
                                future: MessageController.countUnread(document),
                                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                                  if (snapshot.hasData) {
                                    int number = snapshot.data ?? 0;
                                    return number != 0
                                        ? Badge(
                                            label: Text(number.toString()),
                                            backgroundColor: Colors.red,
                                            child: const Icon(Icons.message),
                                          )
                                        : const SizedBox.shrink();
                                  }
                                  return const CupertinoActivityIndicator();
                                },
                              )),
                        );
                      },
                    ).toList());
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 100.0,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "Vous n'avez pas de nouveau message",
                                    style: Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            )
          : const LoginPage(),
    );
  }
}
