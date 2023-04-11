import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchURL {
  final String url;
  final context;

  LaunchURL({required this.url, required this.context}) {
    _launhURL(url, context);
  }
}

void _launhURL(String url, context) async {
   final _urlExp = RegExp(
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');
  if (_urlExp.hasMatch(url)) {
     final Uri urle = Uri.parse(url);
          Fluttertoast.showToast(
        msg: "Vous allez être redirigé ...",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
       if (!await launchUrl(urle)) {
      throw  'Impossible d\'ouvrir le lien $url';
    }

  }
}
