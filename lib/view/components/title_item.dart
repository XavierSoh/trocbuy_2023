import 'package:flutter/material.dart';
import '../../res/styles.dart';

import '../publish/publish_screen1.dart';

class TitleItem extends StatelessWidget {
  final String title;
  const TitleItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, left: 8.0),
      child: Text(
        title,
        style: Styles.kAllFranceButtonTextStyle2.copyWith(fontSize: 22),
      ),
    );
  }
}

class TitleVotreAnnonce extends StatelessWidget {
  final String title;
  const TitleVotreAnnonce({Key? key, this.title = "Votre annonce"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Styles.kAllFranceButtonTextStyle2
            .copyWith(fontWeight: FontWeight.w400, fontSize: 27),
      ),
    );
  }
}

class TextF extends StatelessWidget {
  final String initialValue;
  final void Function(String)? callBack;
  final TextInputType? keyboardType;
  final int maxline;
  final String? hintText;
  final bool obscureText;
  final String? prefix;
  final String? Function(String?)? validationCallBack;
  const TextF(
      {Key? key,
      required this.initialValue,
      this.callBack,
      this.keyboardType,
      this.hintText,
      this.maxline = 1,
      this.obscureText = false,
      this.validationCallBack,
      this.prefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: TextFormField(
        style: const TextStyle(fontFamily: 'ytv', fontSize: 20.0),
        initialValue: initialValue,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxline,
        validator: validationCallBack,
        decoration: InputDecoration(
          prefixText: prefix,
          hintText: hintText,
          isDense: true,
          border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Styles.principalColor, width: 1.0),
              borderRadius: BorderRadius.circular(5.0)),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Styles.principalColor, width: 1.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: callBack,
      ),
    );
  }
}

class Continue extends StatelessWidget {
  final Function()? function;
  final Color colour;
  final String text;
  const Continue(
      {Key? key,
      this.function,
      this.colour = Colors.green,
      this.text = 'CONTINUER'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: colour,
            foregroundColor: Colors.white,
          ),
          onPressed: function,
          child: SizedBox(
            width: 100.0,
            child: Center(
              child: Text(text,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 18.0, fontFamily: 'ytv')),
            ),
          ),
        ),
      ),
    );
  }
}

class Continue2 extends StatelessWidget {
  const Continue2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PublishScreen1(),
              ),
            );
          },
          child: const Text(
            'CONTINUER',
            style: TextStyle(
                color: Colors.white, fontSize: 18.0, fontFamily: 'ytv'),
          ),
        ),
      ),
    );
  }
}

class Valider extends StatelessWidget {
  final Function()? function;
  const Valider({Key? key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          onPressed: function,
          child: const Text(
            'VALIDER',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}

class Titre extends StatelessWidget {
  final String title;
  const Titre(@required this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Text(
          title,
          style: const TextStyle(fontFamily: 'ytv', fontSize: 20.0),
        ),
      ),
    );
  }
}
