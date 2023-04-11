import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../res/strings.dart';

class LaunchLink {
  final _urlExp = RegExp(
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');
  launchURL(String url, BuildContext context) async {
    if (_urlExp.hasMatch(url)) {
      final Uri urle = Uri.parse(url);
      FocusScope.of(context).unfocus();
      Fluttertoast.showToast(
          msg: "This is Center Short Toast",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      if (!await launchUrl(urle)) {
        throw '$Strings.kUnableToOpenLink $url';
      }
    }
  }
}
