import 'package:flutter/material.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';
import '../../utils/utils.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);
  static const id = "about";
  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.principalColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Image.asset(Utils.logoPath, height: 64),
            subtitle: Text("${Strings.kVersion} $Utils.versionNumber",
                style: const TextStyle(color: Colors.white60),
                textAlign: TextAlign.center),
          ),
          const SizedBox(height: 32.0),
          Image.asset(Utils.launchIconPath, height: 100),
          const SizedBox(height: 32.0),
          Text("© ${Utils.appName} ${DateTime.now().year}",
              style: const TextStyle(color: Colors.white60, fontSize: 16),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
