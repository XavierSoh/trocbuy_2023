import 'package:flutter/material.dart';

import '../../../res/styles.dart';

class TitleItem extends StatelessWidget {
  final String title;
  const TitleItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, left: 8.0),
      child: Text(
        title,
      ),
    );
  }
}

class TextF extends StatelessWidget {
  final String initialValue;
  final Function(String value)? callBack;
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
                borderRadius: BorderRadius.circular(5.0))),
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
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: 'ytv')),
              ),
            )),
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
