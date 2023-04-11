import 'package:flutter/material.dart';

import '../../../res/strings.dart';
import '../../login_page/functions/email_validator.dart';

class TextFormFieldEmail extends StatelessWidget {
  final TextEditingController controller;

  final Function(String)? onChanged;

  const TextFormFieldEmail(
      {Key? key, required this.controller, this.onChanged, this.initialEmail})
      : super(key: key);

  final String? initialEmail;
  @override
  build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(10.0),
      child: TextFormField(
        initialValue: initialEmail,
        keyboardType: TextInputType.emailAddress,
        controller: initialEmail == null ? controller : null,
        // ignore: missing_return
        validator: (input) {
          return EmailValidator.validate(input!)
              ? null
              : Strings.kMissingOrIncorrectEmail;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          //focusedBorder: InputBorder.none,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15.0),
          hintText: Strings.kEmail,
          label: Text(Strings.kEmail),
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
