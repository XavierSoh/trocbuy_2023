import 'package:flutter/material.dart';

class ButtonCreate extends StatelessWidget {
  ButtonCreate({
    Key? key,
    required this.padding,
    required this.title,
    this.onPressed,
    this.color,
    this.minWidth,
  }) : super(key: key);
  final String title;
  final Color? color;
  final Function()? onPressed;
  EdgeInsets padding;
  double? minWidth;
  @override
  build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        //width: 260.0,
        height: 45.0,
        child: MaterialButton(
          minWidth: minWidth,
          elevation: 8,
          color: color,
          disabledColor: Colors.white10,
          shape: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            borderRadius: BorderRadius.circular(15),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(fontSize: 22.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
