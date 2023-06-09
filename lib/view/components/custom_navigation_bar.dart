import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/view/favorite/provider/provider_favorite.dart';
import 'package:trocbuy/view/message/message_controller/message_controller.dart';

import '../../providers/navigation_index.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';
import '../../res/themes/themes.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final backgroundColor = Styles.principalColor;
  int count = 0;

  @override
  build(BuildContext context) {
    final index = context.watch<NavigationIndexProvider>().index;
    final changeIndex = context.read<NavigationIndexProvider>();
    final favorites = Provider.of<FavoriteFunctions>(context).adFavorites;
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (index) => changeIndex.changeIndex(index),
      selectedIconTheme:
          CustomThemes.themeData.bottomNavigationBarTheme.selectedIconTheme,
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: Strings.kSearch,
            backgroundColor: backgroundColor),
        BottomNavigationBarItem(
            icon: Badge(
              isLabelVisible: favorites.isNotEmpty,
              label: Text(favorites.length.toString()),
              child: const Icon(Icons.favorite),
            ),
            label: Strings.kFavorites,
            backgroundColor: backgroundColor),
        BottomNavigationBarItem(
            icon: const Icon(Icons.publish),
            label: Strings.kPublish,
            backgroundColor: backgroundColor),
        BottomNavigationBarItem(
            backgroundColor: backgroundColor,
            label: Strings.kMessage,
            icon: StreamBuilder<QuerySnapshot>(
              stream: MessageController.countAllUnread,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  final int count = snapshot.data?.size ?? 0;

                  return count > 0
                      ? Badge(
                          label: Text(count.toString()),
                          backgroundColor: Colors.red,
                          child: const Icon(Icons.message),
                        )
                      : const Icon(Icons.message);
                }
                return const Icon(Icons.message);
              },
            )),
        BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: Strings.kAccount,
            backgroundColor: backgroundColor),
      ],
    );
  }
}
