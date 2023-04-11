import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/publish_provider.dart';
import 'publish_screen0.dart';

import '../../model/is_login.dart';
import '../components/app_bar/default_app_bar.dart';
import '../login_page/login_page.dart';

class PublishScreen extends StatefulWidget {
  static const id = 'publish_screen';
  const PublishScreen({Key? key}) : super(key: key);

  @override
  State<PublishScreen> createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
  @override
  build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 0),
      () {
        Provider.of<PublishProvider>(
          context,
          listen: false,
        ).clearPublishProvider();
      },
    );
    return Scaffold(
      appBar: DefaultAppBar(
          title: IsLogin.state == true
              ? 'Déposer une annonce'
              : 'Connexion à votre compte'),
      body: IsLogin.state == true ? const PublishScreen0() : const LoginPage(),
    );
  }
}
