import 'package:flutter/material.dart';
import 'package:trocbuy/res/styles.dart';

class AboutPremiumPage extends StatelessWidget {
  const AboutPremiumPage({Key? key}) : super(key: key);
  final space = const SizedBox(
    height: 16.0,
  );
  final color1 = Colors.white;
  final color2 = Colors.white70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.principalColor,
        centerTitle: true,
        title: SizedBox(
          child: Image.asset('images/logof.png'),
          width: MediaQuery.of(context).size.width * 60 / 100,
          height: 24.0,
        ),
      ),
      backgroundColor: Styles.principalColor,
      body: ListView(
        children: [
          space,
          space,
          ListTile(
            title: Text(
              "COMMENT FONCTIONNE L'ANNONCE PREMIUM ?",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: color2,
                  ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "L'annonce premium permet de garantir à votre annonce une bonne visibilité. En effet, en choisissant cette option, vous apparaissez dans le menu du haut. Votreannonce ressort en fonction de la recherche de l'utilsiateur.",
                textAlign: TextAlign.justify,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: color1),
              ),
            ),
          ),
          space,
          space,
          ListTile(
            title: Text(
              "COMMENT METTRE MON ANNONCE EN PREMIUM?",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: color2,
                  ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Vous pouvez mettre votre annonce en Premium depuis l'espace utilisateur de votre compte.",
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: color1,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
