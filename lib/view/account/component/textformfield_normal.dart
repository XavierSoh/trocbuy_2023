import 'package:flutter/material.dart';

import '../../../global_functions/default_validator.dart';

class TextFormFieldNormal extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Function(String string)? onChanged;
  final String? Function(String? string)? validator;
  final bool obscureText;
  final TextInputType keyboardType;
  final suffixIcon;
  final int maxLines;
  final bool? withTextSize;
  const TextFormFieldNormal(
      {Key? key,
      this.suffixIcon = const SizedBox.shrink(),
      required this.controller,
      this.hintText = "",
      this.onChanged,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.maxLines = 1,
      this.withTextSize = false})
      : super(key: key);

  @override
  build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(10.0),
      child: TextFormField(
        maxLines: maxLines,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator ,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15.0),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
              fontSize: withTextSize == true ? 15 : null,
            ),
            suffixIcon: suffixIcon),
      ),
    );
  }
}
