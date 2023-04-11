import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/is_login.dart';
import '../components/app_bar/default_app_bar.dart';
import '../login_page/login_page.dart';
import 'comptePage.dart';

late SharedPreferences prefs;
bool isLoading = false;

class AccountHome extends StatelessWidget {
  static const id = 'account_screen';

  const AccountHome({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title:
            IsLogin.state == true ? "Mon Compte" : "Connexion à votre compte",
      ),
      body: IsLogin.state == true ? const comptePage() : const LoginPage(),
    );
  }
}
