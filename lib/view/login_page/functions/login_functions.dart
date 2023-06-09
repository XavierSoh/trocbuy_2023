import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../res/strings.dart';
import '../../../res/styles.dart';
import '../../../services/helper_functions.dart';
import '../../../services/share_preference.dart';
import '../../home/home.dart';
import '../provider/info_compte.dart';
import 'email_validator.dart';

class LoginFunction {
  SharedPreferences? prefs;
  static Future<void> showErrorAlertDialog(BuildContext context) async {
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
                Strings.kError,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Divider(height: 2, color: Colors.white),
            ],
          ),
          content: Text(
            Strings.kIncorrectEmailOrPassword,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: const Text(
                "OK",
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> signIn(Response response, BuildContext context) async {
    try {
      Provider.of<InfoCompteController>(context, listen: false)
          .InfoGlobal['id_acc'] = json.decode(response.body)['id_acc'];

      await HelperFunctions.saveUserLoggedInSharedPreference(true);
      await setUserInfo(response);

      Provider.of<InfoCompteController>(context, listen: false)
          .getInfoCompte(context, response);
      Provider.of<InfoCompteController>(context, listen: false).adsNumber(
          Provider.of<InfoCompteController>(context, listen: false)
              .InfoGlobal['id_acc'],
          context);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    } catch (e) {
      extension(e.toString());
    }
  }

  static String? passwordValidator(input) {
    if (input.length < 8) {
      return Strings.kPasswordErrorMessage;
    } else {
      return null;
    }
  }

  static String? emailValidator(input) {
    return EmailValidator.validate(input)
        ? null
        : Strings.kIncorrectEmailMessage;
  }
}
