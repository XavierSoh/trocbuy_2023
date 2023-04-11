import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../res/styles.dart';
import '../../../utils/utils.dart';
import '../app_bar_actions.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSize {
  final String? title;
  final bool showMenubutton;
  const DefaultAppBar({Key? key, this.title, this.showMenubutton = true})
      : super(key: key);

  @override
  build(BuildContext context) {
    return AppBar(
      backgroundColor: Styles.principalColor,
      centerTitle: true,
      automaticallyImplyLeading: true,
      actions: showMenubutton ? AppBarActions.helpActions() : null,
      title: title == null
          ? SizedBox(
              height: 20,
              child: Image.asset(
                Utils.logoPath,
              ),
            )
          : AutoSizeText(
              title!,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }

  @override
  Size get preferredSize =>
      Size(AppBar().preferredSize.width, AppBar().preferredSize.height);

  @override
  Widget get child => throw UnimplementedError();
}
