import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import '../../res/styles.dart';
import '../components/app_bar/default_app_bar.dart';

import '../account/account_home.dart';
import '../components/button_create.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    Future<void> _showAlertDialogValide(BuildContext context) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Styles.principalColor,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Réinitialisation de mot de passe',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Divider(height: 2, color: Colors.white),
              ],
            ),
            content: const Text(
              'Consulte votre boite mail pour voir votre nouveau mot de passe .',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text("OK", style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountHome(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> _showAlertDialogErreur(BuildContext context) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Styles.principalColor,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Réinitialisation de mot de passe',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'ytv',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  height: 2,
                  color: Colors.white,
                ),
              ],
            ),
            content: const Text(
              'Votre email n\'existe pas .',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("OK", style: TextStyle(fontSize: 16)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        },
      );
    }

    Size size = MediaQuery.of(context).size;

    TextEditingController _emailController = TextEditingController();
    String url = "https://trocbuy.fr/acc_password.php";
    return SafeArea(
        child: Scaffold(
      appBar: const DefaultAppBar(title: 'Mot de passe oublié ?'),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Réinitialiser le mot de passe',
                      style: TextStyle(
                        color: Styles.principalColor,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                        //focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(15.0),
                        hintText: 'E-mail',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            ButtonCreate(
                minWidth: 260,
                color: const Color.fromRGBO(31, 201, 99, 1),
                title: 'Valide',
                padding: const EdgeInsets.all(0),
                onPressed: () async {
                  await EasyLoading.show(status: 'Connexion en cours');
                  final Map body = {'email': _emailController.text.toString()};
                  http.Response response =
                      await http.post(Uri.parse(url), body: body);
                  try {} catch (e) {}
                  if (response.statusCode == 302) {
                    _showAlertDialogValide(context);
                  }

                  if (response.statusCode == 200) {
                    _showAlertDialogErreur(context);
                  }

                  EasyLoading.dismiss();
                }),
          ],
        ),
      ),
    ));
  }
}
