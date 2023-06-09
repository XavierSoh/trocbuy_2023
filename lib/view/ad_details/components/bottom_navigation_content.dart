import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trocbuy/model/is_login.dart';
import 'package:trocbuy/model/message_model.dart';
import 'package:trocbuy/providers/message_model_prov.dart';
import 'package:trocbuy/view/home/home.dart';
import 'package:trocbuy/view/message/message_controller/message_controller.dart';

import '../../../providers/navigation_index.dart';
import '../../../providers/selected_ad.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';
import '../../message/conversations.dart';
import 'contact_dialog_content.dart';

class BottomNavigationContent extends StatelessWidget {
  const BottomNavigationContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAd = context.watch<SelectedAd>().ad;
    final changeIndex = context.read<NavigationIndexProvider>();
    return Container(
      color: Colors.white,
      height: 60.0,
      child: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BottomItem(
              icon: const Icon(
                Icons.call,
                color: Colors.white,
              ),
              title: Strings.kContact,
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const ContactDialogContent();
                  },
                );
              },
            ),
            BottomItem(
              icon: const Center(
                child: Icon(Icons
                    .favorite_rounded) /*DisplaysFavoriteIcons(
                  typeButton: false,
                  idAd: currentAd!.idAd.toString(),
                )*/
                ,
              ),
              title: Strings.kFavorites,
              onPressed: () async {
                context.read<NavigationIndexProvider>().changeIndex(1);
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
            BottomItem(
              icon: const Icon(
                Icons.message,
                color: Colors.white,
              ),
              title: Strings.kMessage,
              onPressed: IsLogin.state == true
                  ? () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      final email = prefs.getString('email');

                      context.read<MessageModelProv>().change(
                            MessageModel(
                              emails: [email!, currentAd!.email!],
                              senderEmail: email,
                              receiverEmail: currentAd.email!,
                              date: DateTime.now(),
                              idAd: currentAd.idAd!,
                              title: currentAd.title,
                              author: currentAd.name,
                            ),
                          );

                      await MessageController.updateReadState(context).then(
                        (value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Conversations(),
                            ),
                          );
                        },
                      );
                    }
                  : () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                  'Vous devez vous authentifier pour continuer'),
                              content: CupertinoButton.filled(
                                onPressed: () {
                                  changeIndex.changeIndex(4);
                                  Navigator.pushReplacementNamed(
                                    context,
                                    Home.id,
                                  );
                                },
                                child: Text('Connexion'),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Fermer'),
                                ),
                              ],
                            );
                          });
                    },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  final Function()? onPressed;
  final Widget icon;
  final String title;

  const BottomItem(
      {Key? key, this.onPressed, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            backgroundColor: Styles.principalColor,
            radius: 19,
            child: Center(
              child: IconButton(icon: icon, onPressed: onPressed),
            ),
          ),
        ),
        Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Styles.principalColor,
            ),
          ),
        )
      ],
    );
  }
}
