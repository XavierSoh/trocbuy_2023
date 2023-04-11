import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/is_login.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';
import '../app_bar_actions.dart';

class AccountScreenAppBar extends StatelessWidget {
  const AccountScreenAppBar({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return AppBar(
      actions: AppBarActions.appBarAccountScreenActions(context),
      backgroundColor: Styles.principalColor,
      centerTitle: true,
      title: IsLogin.state == true
          ? Text(
              Strings.kAccount,
            )
          : Text(
              Strings.kLogin,
            ),
    );
  }
}
