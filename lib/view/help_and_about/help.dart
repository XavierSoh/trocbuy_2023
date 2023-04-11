import 'package:flutter/material.dart';
import '../../res/strings.dart';
import '../components/app_bar/default_app_bar.dart';
import 'condition_general.dart';
import 'faq.dart';

import 'about.dart';
import 'contact_us.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);
  static const id = "help";
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: Strings.kHelp, showMenubutton: false),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: Text(Strings.kHelpCenter),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FAQ(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_outlined),
            title: Text(Strings.kContactUs),
            subtitle: Text(Strings.kNeedHelpOrQuestion),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactUs(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.insert_drive_file_outlined),
            title: Text(Strings.kCGU),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConditionGenerale(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(Strings.kAppInfo),
            onTap: () {
              Navigator.pushReplacementNamed(context, About.id);
            },
          )
        ],
      ),
    );
  }
}
