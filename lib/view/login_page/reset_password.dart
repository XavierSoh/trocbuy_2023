import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:trocbuy/res/strings.dart';
import 'package:trocbuy/view/login_page/functions/email_validator.dart';
import '../../res/styles.dart';
import '../components/app_bar/default_app_bar.dart';

import '../account/account_home.dart';
import '../components/button_create.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);
  final space = const SizedBox(height: 50);

  @override
  build(BuildContext context) {
    Future<void> _showAlertDialogValide(BuildContext context, String message) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Styles.principalColor,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.passReset,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Divider(height: 2, color: Colors.white),
              ],
            ),
            content: Text(
              message,
              style: const TextStyle(
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
              children: [
                Text(
                  Strings.passReset,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'ytv',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Divider(
                  height: 2,
                  color: Colors.white,
                ),
              ],
            ),
            content: const Text(
              'Addresse email incorrecte',
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

    TextEditingController _emailController = TextEditingController();
    String url = "https://api.trocbuy.fr/flutter/xav_reset_password.php?email=";
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Mot de passe oublié ?'),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                space,
                Text(
                  Strings.passReset,
                  style: const TextStyle(
                    color: Styles.principalColor,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
                space,
                Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value){
                      final bool isValid = EmailValidator.validate(value!);
                      if(!isValid){
                        return 'Adresse email invalide';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(15.0),
                      hintText: 'E-mail',
                      hintStyle: TextStyle(color: Colors.grey.shade600),

                    ),
                  ),
                ),
                space,
                ButtonCreate(
                    minWidth: 260,
                    color: const Color.fromRGBO(31, 201, 99, 1),
                    title: 'Valider',
                    padding: const EdgeInsets.all(0),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          await EasyLoading.show(status: Strings.passReset + '...');
                          http.get(Uri.parse(url + _emailController.text)).then((response) {

                            String status = jsonDecode(response.body)['status'] ?? '--';
                            if (status == 'no_exists') {
                              _showAlertDialogErreur(context);
                            } else {
                              String message = jsonDecode(response.body)['message'] ?? '--';
                              _showAlertDialogValide(context, message);
                            }
                          });
                        } catch (e) {
                          //
                        }
                        await EasyLoading.dismiss();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
