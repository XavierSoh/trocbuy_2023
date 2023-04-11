import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../res/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home/home.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool agree = false;

  Future<bool> getAgree() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    bool agree2 = sharedPreferences.getBool("agree") ?? false;
    setState(() {
      agree = agree2;
    });

    return agree2;
  }

  Future<bool> _doSomething(bool newValue) async {
    // Do something
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool("agree", newValue);
    bool agree = await getAgree();
    return agree;
  }

  @override
  void initState() {
    getAgree();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.principalColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Center(
            child: SizedBox(height: 20, child: Image.asset('images/logof.png')),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Material(
                  child: Checkbox(
                    tristate: false,
                    value: agree,
                    onChanged: (value) {
                      _doSomething(value!);
                      setState(() {
                        agree = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(text: "J'ai lu et j'accepte les "),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () async {
                              const urlTerms =
                                  "https://trocbuy.fr/en/info/Terms-of-Use-3";
                              if (await canLaunch(urlTerms)) {
                                await launch(urlTerms);
                              }
                            },
                            child: const Text("conditions d'utilisation",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0)),
                          ),
                        ),
                        const TextSpan(
                          text: "\n de l'application Trocbuy",
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Styles.principalColor)),
                onPressed: agree == true
                    ? () async {
                        await _doSomething(agree);
                        if (agree) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                              (route) => route.isFirst);
                        }
                      }
                    : () {},
                child: const Text('Continuer'))
          ],
        ));
  }
}
