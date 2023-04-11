import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/navigation_index.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';

import '../../res/themes/themes.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key});
  final backgroundColor = Styles.principalColor;
  @override
  build(BuildContext context) {
    final index = context.watch<NavigationIndexProvider>().index;
    final changeIndex = context.read<NavigationIndexProvider>();
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
            icon: const Icon(Icons.favorite),
            label: Strings.kFavorites,
            backgroundColor: backgroundColor),
        BottomNavigationBarItem(
            icon: const Icon(Icons.publish),
            label: Strings.kPublish,
            backgroundColor: backgroundColor),
        /*FFNavigationBarItem(
            iconData: Icons.message,
            label: Strings.kMessage,
            selectedBackgroundColor: backgroundColor),*/
        BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: Strings.kAccount,
            backgroundColor: backgroundColor),
      ],
    );
  }
}
