import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/password_provider.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/button_create.dart';
import 'Widget/password_field.dart';
import 'functions/update_password.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late SharedPreferences prefs;
  late String email;

  Future readLocal() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? '';
    });
  }

  @override
  void initState() {
    readLocal();
    super.initState();
  }

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppBar(
        title: 'Mis à jour du mot de pass',
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Nous vous conseillons d’utiliser un mot de passe sûr que vous n’utilisez nulle part ailleurs",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    PasswordField(
                      hintText: 'Mot de passe actuel',
                      obscureText:
                          Provider.of<PasswordProvider>(context).hidePassword,
                      onPressed: () =>
                          Provider.of<PasswordProvider>(context, listen: false)
                              .changeHidePassword(),
                      textEditingController: _oldPasswordController,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    PasswordField(
                      hintText: 'Votre nouveau mot de passe',
                      obscureText:
                          Provider.of<PasswordProvider>(context).hideNPassword,
                      onPressed: () =>
                          Provider.of<PasswordProvider>(context, listen: false)
                              .changeHideNewPassword(),
                      textEditingController: _newPasswordController,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    PasswordField(
                      hintText: 'Confirmez votre mot de passe',
                      obscureText:
                          Provider.of<PasswordProvider>(context).hideCPassword,
                      onPressed: () =>
                          Provider.of<PasswordProvider>(context, listen: false)
                              .changeHideConfirmPassword(),
                      textEditingController: _confirmPasswordController,
                    ),
                  ],
                ),
                ButtonCreate(
                  title: 'Valider',
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  minWidth: 150,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await EasyLoading.show(
                          status: 'Modification du mot de passe');
                      if (_newPasswordController.text ==
                              _confirmPasswordController.text &&
                          _newPasswordController.text !=
                              _oldPasswordController.text) {
                        try {
                          UpdatePassword.info['email'] = email;
                          UpdatePassword.info['passwordA'] =
                              _oldPasswordController.text.toString();
                          UpdatePassword.info['passwordN'] =
                              _newPasswordController.text.toString();

                          var response = await http.post(
                              Uri.parse(
                                  "https://api.trocbuy.fr/flutter/duo_update_password.php"),
                              body: jsonEncode(UpdatePassword.info));
                          print('Body pass>>> ${response.body}');
                          if (jsonDecode(response.body)['resultat'] == true) {
                            EasyLoading.showSuccess('Mot de passe changé',
                                    duration: const Duration(seconds: 2))
                                .then((value) {
                              _oldPasswordController.clear();
                              _newPasswordController.clear();
                              _confirmPasswordController.clear();
                            });
                            Provider.of<PasswordProvider>(context,
                                    listen: false)
                                .changeHidePasswordToFalse();
                            Navigator.of(context).pop();
                          } else {
                            EasyLoading.showError('Verfiez vos informations',
                                duration: const Duration(seconds: 2));
                          }
                        } catch (e) {
                          print('Pass error>>> $e');
                          EasyLoading.showError(
                              'Erreur de changement de mot de passe, veuillez réessayer',
                              duration: const Duration(seconds: 2));
                        }
                      } else {
                        EasyLoading.showError('Vérifiez votre mot de passe',
                            duration: const Duration(seconds: 2));
                      }
                      await EasyLoading.dismiss();
                    }
                  },
                  color: Colors.green,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
