import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:share/share.dart';
import '../../main.dart';
import '../../res/strings.dart';

import '../../model/is_login.dart';
import '../../services/helper_functions.dart';
import '../help_and_about/help.dart';

class AppBarActions {
  static List<Widget> helpActions() {
    return [
      PopupMenuButton(
        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.share),
              title: Text(
                Strings.kShare,
              ),
            ),
            onTap: () {
              Share.share(
                Strings.kShareAppText,
              );
            },
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.info),
              title: Text(Strings.kHelp),
              onTap: () {
                Navigator.pushReplacementNamed(context, Help.id);
              },
            ),
          ),
        ],
      )
    ];
  }

  static List<Widget> appBarAccountScreenActions(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    return [
      IsLogin.state == true
          ? IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await EasyLoading.show(status: Strings.kLogOutText);
                try {
                  await firebaseAuth.signOut().then(
                    (value) async {
                      await HelperFunctions.saveUserLoggedInSharedPreference(
                          false);
                      // context.read<NavigationIndexProvider>().index=3;
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Trocbuy(),
                        ),
                      );
                    },
                  );
                } catch (e) {
                  EasyLoading.showError(
                    Strings.kTryAgainLater,
                    duration: const Duration(seconds: 2),
                  );
                }
                EasyLoading.dismiss();
              },
            )
          : const SizedBox.shrink(),
    ];
  }
}
