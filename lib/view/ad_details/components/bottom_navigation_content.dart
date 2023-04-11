import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Conversations(
                      autorName: currentAd!.name ?? "",
                      id: currentAd.idAd.toString(),
                      autorMail: currentAd.email ?? "",
                    ),
                  ),
                );
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
